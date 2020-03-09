Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E207817E9A9
	for <lists+samba-technical@lfdr.de>; Mon,  9 Mar 2020 21:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=yri5yRGwb0BaXiptuHnFXYSr1bKUQLoSSjcbJoBen6w=; b=d4A1DeDhaHk3U/GwVUNEOmqY0q
	LnQQX+2MarOXX9JdycghIII6OxtUcHv9dkVCC9f3j2Fb4T3Y1JMn32caMDJ7dpqAJgYP39tqNOPHm
	sC1b7FBdTxm0KfJxiSz/4BvDhwEwo8ieun7+4pHLIL7ZExvOHWbCRaNfDJdRUnSkxWPfvdxmwbREz
	IMzHBkN3gv2eQHCWlqk0c60FkSKtu7lapzH2XmH7bM0RukjWIFtdhzO98nYArqA71gRqouNf71yGo
	v6XBpTXBVoGPCQSC1/ZS2xtpHOvldt9U9mO/eve1CFxWaVoqfJWJFOs6FXoqP1bYb16z9jbca5Qfx
	KnsaXSPA==;
Received: from ip6-localhost ([::1]:18024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBOdK-00FYyw-Ja; Mon, 09 Mar 2020 20:04:14 +0000
Received: from bex-173-206-187-6.static.tor.primus.ca ([173.206.187.6]:10859
 helo=mail.cord3inc.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1jBOdE-00FYyp-Ia
 for samba-technical@lists.samba.org; Mon, 09 Mar 2020 20:04:10 +0000
Received: from Cord3-EX-2.Cord3Inc.com (10.15.60.53) by
 Cord3-EX-2.Cord3Inc.com (10.15.60.53) with Microsoft SMTP Server (TLS) id
 15.0.1347.2; Mon, 9 Mar 2020 16:03:59 -0400
Received: from Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71]) by
 Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71%12]) with mapi id
 15.00.1347.000; Mon, 9 Mar 2020 16:03:59 -0400
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Samba File Server and Docker
Thread-Topic: Samba File Server and Docker
Thread-Index: AQHV9k0+OD+QMSW56EOhLcjKYAK8fg==
Date: Mon, 9 Mar 2020 20:03:58 +0000
Message-ID: <1583784238870.92348@Cord3Inc.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.15.20.37]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
From: Dan Seguin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Seguin <dan.seguin@Cord3Inc.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=0A=
Hi all, =0A=
=0A=
I would have sworn I saw a snippet lately on the list about there being som=
e issue with running Samba in a container because of required privileges (r=
elating to namespaces?). =0A=
=0A=
I can't seem to find it. I may have seen it in the earlier archives when I =
was dredging for info. =0A=
=0A=
(I hope I'm not going senile here!)=0A=
=0A=
Either way, are there any issues with containerizing Samba (file server)?=
=0A=
=0A=
Thanks in advance. =0A=
=0A=

