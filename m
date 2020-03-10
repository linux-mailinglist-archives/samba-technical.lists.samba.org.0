Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F9A17F04E
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 07:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8QlTlllOsLC6jxNBGfJwp49/6de1oyJwqYky4bXYNzk=; b=deTiMpzc1SS7D1aQR+J6ICIHfk
	uoQh5452L1HjtPqDO8Rp5sMYrNYc+XBw1n1N2qawSkv3yn2VK6THsdL1dxQi7tV9Mw4Pdb8KAqtSa
	knjdF3AVohPtAKLCD+n5MvSysSZNU42Km+HIml121eYnzvJofsuMMRhshQM0TLKBi8TF/TjoZcAJW
	LtgqqCKgrVOTT4PbMPwbgvDtu5Ne7o7NDDT/4a1iPUJBfYfokNsd9sqfwXTYb6CZsiOWoiRcZw5xV
	ZS2AXSXVUyvpa8EwO8m3OLyjQzCNbrJtBghCiS9kUFOVwbQchTEJGPCG/KS7U2Bs8z6QxBfu169pD
	3p4UKupA==;
Received: from ip6-localhost ([::1]:26138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBXvf-00FaqW-5s; Tue, 10 Mar 2020 05:59:47 +0000
Received: from bex-173-206-187-6.static.tor.primus.ca ([173.206.187.6]:15612
 helo=mail.cord3inc.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1jBXvZ-00FaqO-5N
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 05:59:43 +0000
Received: from Cord3-EX-2.Cord3Inc.com (10.15.60.53) by
 Cord3-EX-2.Cord3Inc.com (10.15.60.53) with Microsoft SMTP Server (TLS) id
 15.0.1347.2; Tue, 10 Mar 2020 01:59:29 -0400
Received: from Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71]) by
 Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71%12]) with mapi id
 15.00.1347.000; Tue, 10 Mar 2020 01:59:29 -0400
To: Andrew Bartlett <abartlet@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: Samba File Server and Docker
Thread-Topic: Samba File Server and Docker
Thread-Index: AQHV9k0+OD+QMSW56EOhLcjKYAK8fqhBGuwAgAAqqGw=
Date: Tue, 10 Mar 2020 05:59:29 +0000
Message-ID: <1583819968953.36738@Cord3Inc.com>
References: <1583784238870.92348@Cord3Inc.com>,
 <5703e4c814b59b0624e2dbe99f7d89e79775115f.camel@samba.org>
In-Reply-To: <5703e4c814b59b0624e2dbe99f7d89e79775115f.camel@samba.org>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [174.114.52.125]
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

_______________________________________=0A=
From: Andrew Bartlett <abartlet@samba.org>=0A=
Sent: March 9, 2020 6:29 PM=0A=
To: Dan Seguin; samba-technical@lists.samba.org=0A=
Subject: Re: Samba File Server and Docker=0A=
=0A=
On Mon, 2020-03-09 at 20:03 +0000, Dan Seguin via samba-technical=0A=
wrote:=0A=
> Hi all,=0A=
>=0A=
> I would have sworn I saw a snippet lately on the list about there=0A=
> being some issue with running Samba in a container because of=0A=
> required privileges (relating to namespaces?).=0A=
>=0A=
> I can't seem to find it. I may have seen it in the earlier archives=0A=
> when I was dredging for info.=0A=
>=0A=
> (I hope I'm not going senile here!)=0A=
>=0A=
> Either way, are there any issues with containerizing Samba (file=0A=
> server)?=0A=
=0A=
Yes.  If you want to use vfs_acl_xattr, to store a full NT ACL, then=0A=
you will need the container to be privileged so it can store into the=0A=
root-only namespace.=0A=
=0A=
Andrew Bartlett=0A=
=0A=
--=0A=
Andrew Bartlett=0A=
https://samba.org/~abartlet/=0A=
Authentication Developer, Samba Team         https://samba.org=0A=
Samba Development and Support, Catalyst IT - Expert Open Source=0A=
Solutions=0A=
https://catalyst.net.nz/services/samba=0A=
=0A=
Thanks.=0A=
=0A=
I'm pretty sure it was you that responded to the phantom message I'm alludi=
ng to. Thank you for confirming I'm not totally gone yet.  ;-)=0A=
=0A=
Also, thanks to all who have put up great docs, slides, and talks on Samba.=
 =0A=
=0A=
Everything is so clean, and there is SO, SO much good stuff in the code tha=
t you discover after trying to do it yourself, and you realize, dammit, the=
re's a HUGE call chain there that does *it all for* you correctly, ALREADY.=
 (Big learning curve of cool and proper stuff in there that isn't always ob=
vious)  =0A=
=0A=
And that brings more questions, where do I look next for old school file st=
uff that I need to do at the VFS layer as a Unix C hack, that hasn't been h=
andled upstream without stomping over what the server has done at that poin=
t? =0A=
=0A=
I'm writing a VFS module for a back end encryption and KMI system. I hope t=
hat I can provide something somewhat like the Scanner VFS does, i.e. an api=
 for a plugable backend. =0A=
=0A=
I have a design in mind, not sure of the ramifications involving disconnect=
ed/reconnected sessions and statefulness. =0A=
=0A=
I hope there's interest out there on this, I'll outline how I'm approaching=
 this.  I'll share what I have as things progress, and publish (if deemed s=
olid). =0A=
=0A=
  =0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=

