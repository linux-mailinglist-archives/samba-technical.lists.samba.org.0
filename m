Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF417F07B
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 07:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Bol1waKmXROzSufRxoEHYxtmEtXxFpt+ZnlbvquOVSg=; b=sIgIFAVpv3MFjRFaVr8CUW2P9h
	bUr9rw1OJH/P4/wRw1mG6wDDA1yJk1i07nEfzcw0wAxKE9YHq0BY2BvJ5qgxulYSxVPmRbRGo4bes
	tPBdw6ZIo8+t5+DAG7UUfQPQjaT+i9CthOnVIcUgNPM0L8gQHR7c9h/DCybUtUnt1p1l2LQqw+Ibh
	+bRYB15h4xleCzSfC1RRswGBIXL8MwGS+aJ+zRlsz2Dr7yLKqTNsw1hXI2aXBPPyh+NuHvAZwj12R
	/whGw11yqeG/EmdacI9gHoWdc7lI5bC9PY+S864pXgWISGQJPbOlQilSlNcWXi++8ldWa8O1fi0VG
	gwKgJxCA==;
Received: from ip6-localhost ([::1]:27644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBYKu-00Fb9c-Qk; Tue, 10 Mar 2020 06:25:52 +0000
Received: from bex-173-206-187-6.static.tor.primus.ca ([173.206.187.6]:18341
 helo=mail.cord3inc.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1jBYKn-00Fb9V-Ig
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 06:25:48 +0000
Received: from Cord3-EX-2.Cord3Inc.com (10.15.60.53) by
 Cord3-EX-2.Cord3Inc.com (10.15.60.53) with Microsoft SMTP Server (TLS) id
 15.0.1347.2; Tue, 10 Mar 2020 02:25:38 -0400
Received: from Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71]) by
 Cord3-EX-2.Cord3Inc.com ([fe80::78a8:bf:478d:fa71%12]) with mapi id
 15.00.1347.000; Tue, 10 Mar 2020 02:25:38 -0400
To: Andrew Bartlett <abartlet@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: Samba File Server and Docker
Thread-Topic: Samba File Server and Docker
Thread-Index: AQHV9k0+OD+QMSW56EOhLcjKYAK8fqhBGuwAgAAqqGyAAFdBAP//vT3Y
Date: Tue, 10 Mar 2020 06:25:37 +0000
Message-ID: <1583821540979.90575@Cord3Inc.com>
References: <1583784238870.92348@Cord3Inc.com>	,
 <5703e4c814b59b0624e2dbe99f7d89e79775115f.camel@samba.org>
 <1583819968953.36738@Cord3Inc.com>,
 <186d5e75133319a7620bedd5776729a852634657.camel@samba.org>
In-Reply-To: <186d5e75133319a7620bedd5776729a852634657.camel@samba.org>
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

=0A=
________________________________________=0A=
From: Andrew Bartlett <abartlet@samba.org>=0A=
Sent: March 10, 2020 2:14 AM=0A=
To: Dan Seguin; samba-technical@lists.samba.org=0A=
Subject: Re: Samba File Server and Docker=0A=
=0A=
On Tue, 2020-03-10 at 05:59 +0000, Dan Seguin via samba-technical=0A=
wrote:=0A=
> I'm writing a VFS module for a back end encryption and KMI system. I=0A=
> hope that I can provide something somewhat like the Scanner VFS does,=0A=
> i.e. an api for a plugable backend.=0A=
>=0A=
> I have a design in mind, not sure of the ramifications involving=0A=
> disconnected/reconnected sessions and statefulness.=0A=
>=0A=
> I hope there's interest out there on this, I'll outline how I'm=0A=
> approaching this.  I'll share what I have as things progress, and=0A=
> publish (if deemed solid).=0A=
=0A=
I looked into this for a client a couple of years back, and I strongly=0A=
suggested that they use the kernel VFS or block layer encrypted file=0A=
systems.=0A=
=0A=
The reason I say this is that is is quite tricky to do this right in=0A=
Samba, with complexity and issues similar to the recently removed=0A=
'write cache' code.=0A=
=0A=
The challenges is that Samba clients expect to be able to:=0A=
 - seek to arbitrary file positions=0A=
 - read and write less than a whole block, and not on block offsets=0A=
 - do so safely from multiple clients where a write to position A and B=0A=
are safe and independent, even if they are in the same encryption=0A=
block.=0A=
=0A=
Of course, if your backend is already doing this and you just need to=0A=
interface to their userspace VFS interface, then go right ahead, just=0A=
don't blame Samba if the backend doesn't quite life up to the promises=0A=
it makes :-)=0A=
=0A=
Andrew Bartlett=0A=
=0A=
--=0A=
Andrew Bartlett                       http://samba.org/~abartlet/=0A=
Authentication Developer, Samba Team  http://samba.org=0A=
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba=
=0A=
=0A=
=0A=
I understand. =0A=
=0A=
My proposed design is that the shares (files) are "show only",  any open me=
ans if  "policy" allows, a decrypted copy is made to an isolated "session a=
rea", say a hashed username DOT subdir, the resulting "OPEN" call will then=
 get the decrypted FD returned.  =0A=
=0A=
I'm only worried about the STAT calls in the FSP before any close.  Can I r=
e-write the FSP filename for STAT/LSTAT/etc calls?=0A=
=0A=
Hope this makes sense. =0A=
=0A=
=0A=

