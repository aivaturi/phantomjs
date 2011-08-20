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

#include "response.h"

namespace webdriver {

Response::Response(void) : status_code_(0), session_id_("")
{
}

Response::Response(const QString& session_id)
{
  this->session_id_ = session_id;
  this->status_code_ = 0;
}

Response::~Response(void)
{
}

void Response::Deserialize(const QString& json)
{
  Json::Value response_object;
  Json::Reader reader;
  reader.parse(json.toStdString(), response_object);
  this->status_code_ = response_object["status"].asInt();
  this->session_id_ = QString::fromStdString(response_object["sessionId"].asString());
  this->value_ = response_object["value"];
}

QString Response::Serialize(void)
{
  Json::Value json_object;
  json_object["status"] = this->status_code_;
  json_object["sessionId"] = (this->session_id_).toStdString();
  json_object["value"] = this->value_;
  Json::FastWriter writer;
  QString output(QString::fromStdString(writer.write(json_object)));
  return output;
}

void Response::SetSuccessResponse(const Json::Value& response_value)
{
  this->SetResponse(0, response_value);
}

void Response::SetResponse(const int status_code,
                           const Json::Value& response_value)
{
  this->status_code_ = status_code;
  this->value_ = response_value;
}

void Response::SetErrorResponse(const int status_code,
                                const QString& message)
{
  this->status_code_ = status_code;
  this->value_["message"] = message.toStdString();
}

}  // namespace webdriver
