Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F017C9B1
	for <lists+samba-technical@lfdr.de>; Sat,  7 Mar 2020 01:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QBx+0jpZP7rW/MTKMoiF2yVAqNZXdf/xXTMb+u8UNSM=; b=cWhBX2cL3fqciLyG4Kk90Gx3PG
	5uiBTA923GBw76JTxIhaMFap94Q9I+uZcQSV2oy+RK0GU6UeIKZYNTyKLM/Cq2xZfLXBJeSPYFr9x
	UQsWpckGl7+V6eTpappu3x7rcbFttUZRu/LLSo0NjjkMei2FogbjB+EhyoOkLVIzPdbh4FLDwYtz+
	3pbPoElArem2HBkfXzd9XhIYOckEE71+SeSv4lsfWWC5QgQZRtLp35iHY8OipQSPNmFwBJex2b9dR
	k33PmAuLOHeyn0/hA2lW1ig0y/Ai8DQiv+e1fmSIYmwM2U/ZEmAwZc5Ar0THnd4EiaQZ4ZnwvwgwV
	QUpxpVdQ==;
Received: from localhost ([::1]:47682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jANHQ-00FLii-AM; Sat, 07 Mar 2020 00:25:24 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:65019) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jANHK-00FLib-CL
 for samba-technical@lists.samba.org; Sat, 07 Mar 2020 00:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1583540718; x=1615076718;
 h=from:to:subject:date:message-id:mime-version;
 bh=nQmOK7uqRLuvFFDg+Wg1TBjlQmyObhEPsi8FuBX1508=;
 b=vE122+uELcuc2uY/naulipvb5WMuuCsPIciphwyqazwh0JscoqpUzP5U
 1XOt4+X6/ZJ/6Mok9SOHXSF4akWA1ysP91fmFEsJ/4l+ku4MibAsYBRcy
 NuLbq3ZcwXJgnL87qeB4kOBfyk3hPrcIKEn2UBejDxHQs8bINDMostbsR g=;
IronPort-SDR: kEzFmyv+OPS92szpnCiiqf1MdvxJmxqYjUyY79LSC6Xxy0gEc+GAr+zAaGp646Xp0r30Mh/eWf
 S5VTVwGbj53g==
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Mar 2020 00:09:52 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 43A49A212E; Sat,  7 Mar 2020 00:09:51 +0000 (UTC)
Received: from EX13D21UWA004.ant.amazon.com (10.43.160.252) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Mar 2020 00:09:51 +0000
Received: from EX13D21UWA003.ant.amazon.com (10.43.160.184) by
 EX13D21UWA004.ant.amazon.com (10.43.160.252) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sat, 7 Mar 2020 00:09:50 +0000
Received: from EX13D21UWA003.ant.amazon.com ([10.43.160.184]) by
 EX13D21UWA003.ant.amazon.com ([10.43.160.184]) with mapi id 15.00.1497.006;
 Sat, 7 Mar 2020 00:09:50 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "vl@samba.org" <vl@samba.org>
Subject: Samba 4.11.6: Consecutive calls to smb_raw_open fail
Thread-Topic: Samba 4.11.6: Consecutive calls to smb_raw_open fail
Thread-Index: AQHV9BS48Gs3j9vymkq31I+HZNfjAg==
Date: Sat, 7 Mar 2020 00:09:50 +0000
Message-ID: <9F04A360-00D2-4FA1-B8B1-966B05D6E2A7@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.16]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "Rungta, Vandana via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Rungta, Vandana" <vrungta@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8gVm9sa2VyLA0KDQpUaGUgZm9sbG93aW5nIGNvbW1pdCBicmVha3MgdGhlIHJhdyBvcGVu
IHRlc3QgdGhhdCBoYXMgY29uc2VjdXRpdmUgY2FsbHMgdG8gc21iX3Jhd19vcGVuIHdoZW4gdXNp
bmcgYSBWRlMgbW9kdWxlIHdoaWNoIHNldHMgaXRzIG93biBmc3AgZXh0ZW5zaW9uIGR1cmluZyBv
cGVuOg0KIGh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL2NvbW1pdC8zMjc2NmRi
MjEwNDI2ZDkyOTQ4YTdkODFkOTIzZjlkNjY5ZmYzZWQ2I2RpZmYtMTZiOTA0NWI3ZmU1NjcxMGYz
YTNlNDJhMzljYTFlYzENCg0KVGVzdCBzZXF1ZW5jZSBmcm9tIHNtYnRvcnR1cmUgdGVzdCBzb3Vy
Y2U0L3RvcnR1cmUvcmF3L29wZW4uYyAodGVzdCBSQVdfT1BFTl9PUEVOKToNCg0KICAgICAgICAg
IHN0YXR1cyA9IHNtYl9yYXdfb3BlbihjbGktPnRyZWUsIHRjdHgsICZpbyk7DQoNCiAgICAgICAg
ICBDSEVDS19TVEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOw0KDQogICAgICAgICAgZm51bSA9
IGlvLm9wZW5vbGQub3V0LmZpbGUuZm51bTsNCg0KICAgICAgICAgIENIRUNLX1JEV1IoZm51bSwg
UkRXUl9SRFdSKTsNCg0KDQoNCiAgICAgICAgICBzdGF0dXMgPSBzbWJfcmF3X29wZW4oY2xpLT50
cmVlLCB0Y3R4LCAmaW8pOw0KDQogICogICBTdWNjZWVkcyAtLT4gICAgICAgICBDSEVDS19TVEFU
VVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOw0KDQogICAgICAgICAgZm51bTIgPSBpby5vcGVub2xk
Lm91dC5maWxlLmZudW07DQoNCiAtLT4gRkFJTFMgLS0+IENIRUNLX1JEV1IoZm51bTIsIFJEV1Jf
UkRXUik7ICAgLy8gRG9lcyBhIHByZWFkL3B3cml0ZQ0KDQogICAgICAgICAgc21iY2xpX2Nsb3Nl
KGNsaS0+dHJlZSwgZm51bTIpOw0KDQogICAgICAgICAgc21iY2xpX2Nsb3NlKGNsaS0+dHJlZSwg
Zm51bSk7DQoNCg0KDQpBbmFseXNpczogIE91ciB1c2VyIHNwYWNlIGZpbGUgc3lzdGVtIFZGUyBt
b2R1bGUgd2lsbCBhZGQgYSBmc3AgZXh0ZW5zaW9uIHRvIHRoZSBmc3Agc3RydWN0dXJlIG9uIG9w
ZW4uICBBZnRlciB0aGUgMm5kIG9wZW4sIHRoZSBwcmVhZCBhbmQgcHdyaXRlIGNhbGxzIGFyZSBw
YXNzZWQgYSBmc3AgdGhhdCBkb2VzIG5vdCBoYXZlIHRoZSBGU1AgZXh0ZW5zaW9uIHNldC4NCg0K
DQpUaGUgdGVzdCBwYXNzZXMgaWYgd2UgcmV2ZXJ0IHRoZSBjb21taXQuIFNpbmNlIHRoZSBjb21t
aXQgbW92ZWQgdGhlICBmY2Jfb3JfZG9zX29wZW4gY2FsbCBhbmQgY2hhbmdlZCBpdCB0byBubyBs
b25nZXIgdGFrZXMgYSBmc3AgcGFyYW1ldGVyIGFuZCBzaW5jZSBpdCBjcmVhdGVzIGEgbmV3IGZz
cCBhbmQgd2hlbiBkdXDigJluZyBmcm9tIHRoZSBvcmlnaW5hbCBmc3AgZG9lcyBub3QgY29weSB0
aGUgZnNwIGV4dGVuc2lvbiwgdGhlIGZzcCBleHRlbnNpb24gaXMgbm90IHByZXNlcnZlZC4gIFRo
aXMgZnNwIGlzIHRoZW4gcGFzc2VkIHRvIG91ciBWRlMgbW9kdWxl4oCZcyBwcmVhZC9wd3JpdGUg
d2l0aG91dCB0aGUgZnNwIGV4dGVuc2lvbiAtPiByZXN1bHRpbmcgaW4gb3VyIFZGUyBtb2R1bGUg
cmV0dXJuaW5nIGFuIGVycm9yIOKAnEZpbGUgbm90IG9wZW7igJ0uICBJbnRlcm5hbGx5IGluIHRo
ZSBTYW1iYSBjb2RlIGl0IGlzIHByb2Nlc3NpbmcgTlRfU1RBVFVTX1NIQVJJTkdfVklPTEFUSU9O
IGNvZGUgcGF0aHMuDQoNClByZXZpb3VzIHRvIHRoaXMgY29tbWl0LCB0aGUgZGVzdGluYXRpb24g
ZnNwIHRoYXQgd2FzIHBhc3NlZCB0byBmY2Jfb3JfZG9zX29wZW4gaGFkIHRoZSBmc3BfZXh0ZW5z
aW9uIGFscmVhZHkgc2V0LCBzbyB3aGVuIGR1cOKAmWluZyBpdCBkaWQgbm90IG5lZWQgdG8gYmUg
Y29waWVkLiAgTm93IHRoYXQgdGhlIGRlc3RpbmF0aW9uIGZzcCBpcyBuZXcsIGl0IGRvZXMgbm90
IGhhdmUgdGhlIGZzcCBleHRlbnNpb24gc2V0IGFuZCB3aGVuIHRoZSBmc3AgaXMgcGFzc2VkIHRv
IHRoZSBWRlMgbW9kdWxlIGludGVyZmFjZSBpdCBubyBsb25nZXIgaGFzIHRoZSBWRlMgbW9kdWxl
IGNvbnRleHQuDQoNCkkgaGFwcHkgdG8gcHJvdmlkZSBhbnkgYWRkaXRpb25hbCBpbmZvcm1hdGlv
biAvIGNhbGwgdHJhY2VzIHRoYXQgeW91IG5lZWQuDQoNCg0KDQpUaGFua3MsDQoNClZhbmRhbmEg
UnVuZ3RhDQoNCg==
