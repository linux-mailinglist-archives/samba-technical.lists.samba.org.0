Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8F17AFA1
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 21:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TCY/eWHB5aHap4NfbOAZix1vbYRbl4FOJTIkWDtvII0=; b=sNDPfRiw8rDC/aQIQ8GRuU6ppE
	NQRefI1L1aqT8fn3Qe9IMiI/N+yQ7B/Pj78XBua8AAPuv8m8qBZWSed2bwKzu7Ojpg+udWBEMgF71
	pcFh9M1BDWCkDrkyDzHP5JFUyHV/gXTNMPuIsIfSDaf0gYVA07CPnpvLRMyQlWRONvZj+ZqYX1TR7
	U8DELLXb6Hg0q5iAfP2dL2UUxRjxVsFG2wOq94Dn8t7alKVVpj0647dWhRv9O3RP6CiGFu5JY62J9
	eAaNP/UApeneu9XpJT2fwpNFVcOALfc7fJF+6YefKkv5LImcadhTNPA8WMm/quUchdDe/6nB+z1ML
	9cCuAg6w==;
Received: from localhost ([::1]:37212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9wws-00FAxu-3l; Thu, 05 Mar 2020 20:18:26 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:41998) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9wwm-00FAxm-Vz
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 20:18:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 99CD9D666E0D5;
 Thu,  5 Mar 2020 23:18:17 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id y7rxu7zG5j5w; Thu,  5 Mar 2020 23:18:02 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 31B7CD666EACC;
 Thu,  5 Mar 2020 23:18:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 31B7CD666EACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1583439482;
 bh=TCY/eWHB5aHap4NfbOAZix1vbYRbl4FOJTIkWDtvII0=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=rQft3PvrFKCM/6CM6ZQ8C7Nv4G3fxC6EuYLfFgWg6kKaXx4lHia4Qkv9yaSev4JyM
 MpJdpHi+cDEG85uwKrxDCDZs8mCWgt9flaEnQXKQjp1WeRXckXcUKc72mvN619XAsr
 kCrYPKo6ik/5AOZR9oAyhQuMUwDUIj/znhD+qHBtJXg8uI6r8i563nRyqAEZdR7lJ+
 To6cciZEq7/FShtJ9Ppi+lzBPFNqH26FSuzDj+XlKo38kicpLrQ43UPz4Z0miADvvB
 H41xj6f2NL8W+CuDoaetmfRD/R5fPZ152Mbp8QkJD/jo/6fmSuRdEcEP70p+bBfjKs
 WJaJ+MVr/5FIA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tdLhWlhQ3pP3; Thu,  5 Mar 2020 23:18:02 +0300 (MSK)
Received: from [10.171.174.88] (unknown [176.59.47.40])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id DAAA0D666E0D5;
 Thu,  5 Mar 2020 23:18:01 +0300 (MSK)
Date: Thu, 05 Mar 2020 23:17:54 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <8767977743a6cf16167e1e5f3d951664d3e1a524.camel@samba.org>
References: <20200303104715.GA11956@carrie2>
 <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
 <bcca2904922f9c6f0a3594c39a336f0ab175c4e8.camel@samba.org>
 <DDE986AD-16BC-44FB-BD4A-CD17F9E8BA16@rosalinux.ru>
 <8767977743a6cf16167e1e5f3d951664d3e1a524.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: About 4.11/4.12 and SMB1 being disabled by default
To: Andrew Bartlett <abartlet@samba.org>,samba-technical@lists.samba.org
Message-ID: <860EA9BB-5A19-47F5-B9E1-CB1288E82479@rosalinux.ru>
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



5 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2020 =D0=B3=2E 20:39:21 GMT+03:00, Andrew=
 Bartlett <abartlet@samba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Thu, 2020-03-05 at 10:44 +0300, Mikhail Novosyolov via samba-
>technical wrote:
>>=20
>> 5 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2020 =D0=B3=2E 9:34:36 GMT+03:00, Andr=
ew Bartlett
><abartlet@samba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> > On Thu, 2020-03-05 at 08:13 +0300, Mikhail Novosyolov via samba-
>> > technical wrote:
>> > > Hello,
>> > >=20
>> > > What is the status of SMBv1 in Samba 4=2E12?
>> >=20
>> > Unchanged from Samba 4=2E11, that is off by default but fully
>supported=2E
>> >=20
>> > We are still planning to remove SMB1 in a future version because
>not
>> > only is is an old arcane protocol, it makes being a great SMB2
>server
>> > harder=2E
>>=20
>> Thanks=2E I have looked into the changelog of samba 4=2E11=2E0 [1], but
>> 'client min protocol =3D NT1' had to be explicitly set in 4=2E8+=2E Cou=
ld
>> you please clearify what exactly changed in 4=2E11 regarding smb1? Or
>> maybe point to a commit that made the change=2E
>>=20
>> [1] https://www=2Esamba=2Eorg/samba/history/samba-4=2E11=2E0=2Ehtml
>
>In 4=2E11 we changed the default for "min protocol", which is the server-
>side setting=2E
>
So now detecting unix machines with samba in the network by listing smb://=
/ root with forced NT1 does not detect machines with samba 4=2E11+?

