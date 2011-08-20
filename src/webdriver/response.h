// Copyright 2011 Software Freedom Conservatory
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Defines a response for use in the JSON Wire Protocol. The protocol is
// defined at http://code.google.com/p/selenium/wiki/JsonWireProtocol.

#ifndef WEBDRIVER_SERVER_RESPONSE_H_
#define WEBDRIVER_SERVER_RESPONSE_H_

#include <QString>
#include <json/json.h>

namespace webdriver {

class Response {
 public:
  Response(void);
  explicit Response(const QString& session_id);
  virtual ~Response(void);
  QString Serialize(void);
  void Deserialize(const QString& json);

  int status_code(void) const { return this->status_code_; }

  Json::Value value(void) const { return this->value_; }

  void SetResponse(const int status_code, const Json::Value& response_value);
  void SetSuccessResponse(const Json::Value& response_value);
  void SetErrorResponse(const int error_code, const QString& message);

 private:
  // The status code of the response, indicating success or failure.
  int status_code_;
  // The ID of the session on which the command was executed.
  QString session_id_;
  // A JSON object that represents the value of the response.
  Json::Value value_;
};

}  // namespace webdriver

#endif  // WEBDRIVER_SERVER_RESPONSE_H_
