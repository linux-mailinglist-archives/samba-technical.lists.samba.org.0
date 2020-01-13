Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9102139D44
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 00:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=j1V0972D7cvDZI/VYyuYTm0E/Kc/bk/j8f9tmAgAMBc=; b=pVFU3e35teTXhokNI0vOG5CP4O
	iF8v5sLK2MuxPa80/GuCSAyf4wEKSY+caQnHSagh33GytiXUSCcbFaH2XeD/SR60LsJoDps+OhdEf
	6fsldVdc+tQJTZLzA90WhnpeBDsjWSzYe/T9MTDw+nnANO+Mh/0Ddr6ZZXSHrlrzq+zUvNzI5nTMf
	Ef1A3ZOjD5AnWp3l9B550G1Jly6Fbw1skn1rGwPG7aXXRY4spZeChnNhatKXJCoGyjqLlB+QX9Fav
	8UylQJzChZgGtIeEY4mD6NoytPUIqhTMTzcMSCJMoWVTDkQ7PSO64chhn3wJsq+N1erhwFiCqxRk3
	2xZBLXZA==;
Received: from localhost ([::1]:62780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir98s-003J51-Ax; Mon, 13 Jan 2020 23:29:06 +0000
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:36433) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ir98o-003J4s-L3
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 23:29:05 +0000
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Mon, 13 Jan 2020 23:26:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 13 Jan 2020 22:47:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 13 Jan 2020 22:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1Fn6zaPgee9SCenKLVErzxe+BlpImDGsWkAaNQkOXC4JPxSbIS9XgeBalKJQFmTHuk8XRabN7D1bM7a744zcV0UIQXEHv99YEdLbp7Ujy0Xii9sx24YQBP8EOFUBzFclmfurFpcV4HVFpl3pOw4DUkr4N2HLZW2rti9ObE+c8RiTpfslQt12I5/0JdN8w2rqcBD5+L56kF40nHipXDpztEnSY8N6VDfyqhJe3N0YF+StBrn7D4Dp+w11lulsEGIV+J/zZEiPdde3CHhxLjLZWQmcwEDo6EmXThpdfoJpGVp4OGd/FT61bjY2VE5h0Zu82XrKlblOXeRiz0Zt09tZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwEsGBPWrHw6TmqOwArT9VKrKGrx9wdyudoxkowgfrs=;
 b=eA9T/Rq7NSt9kVMrVTmzkZU/gz7u4foYZ5yqxq55lpV7IQbx5wQQ5V1SANHx1p8sQyA2ygyz+J3VeGth93vaTpak4u/xBrV292N0jQl/QiJwz1F+DnPlkruUD68DDKb7kGEVvkJbKfA3G2g4C0Flb5Q6zxW5dsSES1AvaMZSBOYm0mI0swy4VLx3o6o4kx5fkyjyZWvVsBUklv46tkFmZ7e2cqsnFblxAicvPL9uZsSeTbik/zlmd0+ZpQmS14pCig8S8ePM64FntcquVWzYhB5t7Zn5jZQDXHxr8MqJnCAIu0jVloc2UOJux4qYDtpppbM87IyIn5dryNO4YpiAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3161.namprd18.prod.outlook.com (10.255.172.90) by
 DM6PR18MB3129.namprd18.prod.outlook.com (10.255.174.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 22:47:27 +0000
Received: from DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9]) by DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 22:47:27 +0000
Received: from [192.168.1.10] (74.122.77.94) by
 BY5PR20CA0029.namprd20.prod.outlook.com (2603:10b6:a03:1f4::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13 via Frontend
 Transport; Mon, 13 Jan 2020 22:47:26 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: SMB2 Write truncate
Thread-Topic: SMB2 Write truncate
Thread-Index: AQHVymNtgk8KnRXXf02IdER3VeVXKQ==
Date: Mon, 13 Jan 2020 22:47:26 +0000
Message-ID: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce75e9bf-f2be-4b2b-b803-08d7987a9019
x-ms-traffictypediagnostic: DM6PR18MB3129:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nl+qXZuDZ4FigvDVil2e9DceHe/mI7+ECyc7Hjw8GvS9w8RYhWAQj+8LC9kAOTgEPZsuPYf2zQHo3KRAyxaz2kVdjl3JkmgxCLY6tblJa8DCt+8O0g7sZ34VMW2ief4pNZW9LrjyieQB0QH5Uv9YBExr5Wc18q8ScPAy+pC3GTcLRUsDllkGE/fNqMmP2/fWpejRtFq044l924EQe/9HMVueSKNfwq3kpKgSYv9MkSkjwoVHmrMQTXcwnhJh9cl4WjJ2HwbC+LJX2N3Zriw/5tzx3Wv26xdgnqrYIlOysSv2jZNlQOq7Oh9bbFMwous5oi9RH+zLa6ZOON/SSWzvk6aoxt1VuoJlBKc26yH1wMijSBIzAD5+PImxpw8SjT0fHLu/tfpBI+ATLHT5Qrj66HTXgfHsfjmRi6d47VC36DwumpucYFaQYVb3OH1IQE3XU66T9QqdSZLBtbw0D5m0rGgJlr4q+5F4bTLye2U1KXdSf4VVYTH2fpJ8kaIx6zBCNJ1FpBXSwOcoHLcWA7FXBw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ce75e9bf-f2be-4b2b-b803-08d7987a9019
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVyCsRR6euZ4WOqGWXtY/EdN54c2W7MeDEELHP1r3VpuprtYpz4Veid+KuJk0xnX/EDdV9rEa39UtAApDB06BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3129
X-OriginatorOrg: suse.com
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

QmFzZWQgb24gdGhlIGJlaGF2aW9yIG9mIHRlc3RzIGluIHNvdXJjZTQvdG9ydHVyZS9iYXNpYy9k
ZWxheXdyaXRlLmMsIGl0IHNlZW1zIHNlbmRpbmcgYSB3cml0ZSByZXF1ZXN0IGluIHNtYjEsIHdp
dGggYSBidWZmZXIgc2l6ZSBvZiAwLCB3b3VsZCB0cnVuY2F0ZSB0aGUgZmlsZSAoYXQgbGVhc3Qg
dGhhdCdzIHdoYXQgdGhlIGNvbW1lbnRzIHNheSBpbiB0aGUgdGVzdCkuIFRoZXJlIGRvZXNuJ3Qg
c2VlbSB0byBiZSBhbnkgcmVhc29uIGZvciB0aGUgb2Zmc2V0IHNpemUgaW4gdGhlc2UgdGVzdHMg
KHNvbWUgYXJlIGxlc3MgdGhhbiB0aGUgY3VycmVudCBzaXplIG9mIHRoZSBmaWxlLCBvdGhlcnMg
YXJlIG11Y2ggZ3JlYXRlciB0aGFuIHRoZSBjdXJyZW50IHNpemUsIHdoaWNoIGRvZXNuJ3QgbWFr
ZSBtdWNoIHNlbnNlKS4NCg0KSSdtIHdvcmtpbmcgb24gY29udmVydGluZyB0aGVzZSB0ZXN0cyB0
byBTTUIyLCBidXQgdGhlIGJlaGF2aW9yIGlzbid0IHRoZSBzYW1lLiBBbiBTTUIyIHdyaXRlIHJl
c3BvbmRzIHdpdGggTlRfU1RBVFVTX0lOVkFMSURfUEFSQU1FVEVSIHdoZW4geW91IHNldCB0aGUg
YnVmZmVyIHNpemUgdG8gMC4gSSBjYW4ndCBmaW5kIGluIHRoZSBNUy1TTUIyIHNwZWMgaG93IHRv
IGNvcnJlY3RseSB0cnVuY2F0ZSBhIGZpbGUuIEFueW9uZSBrbm93IGhvdyB0byBkbyB0aGlzPw0K
DQotLQ0KDQpEYXZpZCBNdWxkZXINCkxhYnMgU29mdHdhcmUgRW5naW5lZXIsIFNhbWJhDQpTVVNF
DQoxODAwIE5vdmVsbCBQbGFjZQ0KUHJvdm8sIFVUIDg0NjA2DQooUCkrMSA4MDEuODYxLjY1NzEN
CmRtdWxkZXJAc3VzZS5jb208bWFpbHRvOmRtdWxkZXJAc3VzZS5jb20+DQpbaHR0cHM6Ly93d3cu
c3VzZS5jb20vZW1haWwvaW1nLzIwMTYvZW1haWxfc2lnbmF0dXJlX3N1c2UucG5nXTxodHRwOi8v
d3d3LnN1c2UuY29tLz4NCg==
