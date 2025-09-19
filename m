Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2738B8B668
	for <lists+samba-technical@lfdr.de>; Fri, 19 Sep 2025 23:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=W33l4kObx9Xu+3LTntEEBlIN2qdeR3JORQn6fmBAaHU=; b=s/Xm8pwHCPtltY7/ozlSB1Yc/3
	hyoyMRsdz9KAxTqSc1O0V9oUQeNh5n6WgJw95rd6y0cy2x4oKfwjIIxw4axOzLez9AIsaTG29BtsL
	bBIHzwT8qMxLrqj6DJl5D/R1o2OG4XiTQkQtKZZsYzyySJLPZx28p7PWyuMv9TQ4Hm9jpHXbb4QJd
	UXW1+5ZdYvhFCoV+FPJlRxfINgRrd8ipl8gHdZzcfWOmSKTMLJfz8+taorPTKgzdWJC/ICQv8i4Bh
	KvwOBpQfPjmHhW2lghJC/5fEqkq/evlprR/8g6Y6d9W9dBNqDC9Z/yIGt9PDHzUUHXfnpVMgF7agu
	83ZULIKw==;
Received: from ip6-localhost ([::1]:25464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uziyv-004KH6-Sv; Fri, 19 Sep 2025 21:49:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48606) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uziyr-004KGz-Ef
 for samba-technical@lists.samba.org; Fri, 19 Sep 2025 21:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=PkwGrdKNjuwafOlFigGW7YGKKXPw9oC1OvLPB5iX160=; b=OQrF4TkGxnYBVNXuWQZEZ2kWTW
 0oLbHLNMdWQvZLkT5RsAD8UxTH08WPvl93J2e5zgkxG70H+sRsosgDcH9xU79BN+OLMccpteKIIbu
 ndK+dY3BYP+PtErEldR5mwPUFahg9HWRYb4AsBPThl68vOS8Aeq3FfLp5HjpdzTSWnv1eUCFVK1pW
 PKJ+eD0FE3iGLfri1Tq4zd2l+I46vpSMUe5JeLxtwrPmBhNv2leeJhherQ23O7CAYjpN7S+/ShsWX
 mZIS7GW6fjSe5MVGRhSRh8DEYSNIyRQBU5n4KOgLf1naU56iqNuurqAEbSR7L1t6q3U/HeFzOD2yU
 8DFkoIACM3BmEuKCyQhyidYLqygRKwUQMekdaNq5AXlfTVSx9GRId1qY4LRKnhpKUnesVllN8Fhi0
 AON8HbO1PRU8GehUAutx3rzUfxvExTBBXcczE7aiRJvsnlDVoHdgDoZmOmJ4T/FJCQRhoX65A2ZCd
 gFYaQWOkYJbHl9QHVr36hXNe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uziyp-0050mF-2Q; Fri, 19 Sep 2025 21:49:24 +0000
Message-ID: <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Michael Tokarev <mjt@tls.msk.ru>, Vinit Agnihotri
 <vinit.agnihotri@gmail.com>, samba-technical@lists.samba.org
Date: Sat, 20 Sep 2025 09:49:20 +1200
In-Reply-To: <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
 <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2025-09-19 at 22:39 +0300, Michael Tokarev via samba-technical
wrote:
> On 19.09.2025 15:02, Vinit Agnihotri via samba-technical wrote:
> > Hello,
> >=20
> > Coverity Id#1509031 and 1509040, reports Y2K38_SAFETY issue for
> > 'pass_last_set_time' in file "source3/passdb/pdb_smbpasswd.c".
> > https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssu=
e=3D1509031
> > https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssu=
e=3D1509040
> >=20
> > Although this is defined as time_t, we are storing it in file as a hex
> > string of 8 bytes(uint32_t)as opposed to a hex string of 16 bytes
> > (uint64_t/intmax_t)
> > Existing entry looks like:
> > xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C=
:[U]:LCT-ABCDABCD
> >=20
> > Main crux is to ensure conversion of existing entries so that new chang=
es
> > won't break older file.
> > I'd like to propose an approach to deal with this issue.
> >=20
> > Proposal states that on opening this password file, we check the hex st=
ring
> > which represents "pass_last_set_time". If this string comes out to be 8
> > bytes, then we flag this as old format and then we read every record on=
e by
> > one and convert it into a 16 byte hex-string and write it back to file.
> > New entry would look like:
> > xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C=
:[U]:LCT-ABCDABCDABCDABCD
>=20
> There's no need to worry about this at all, I think.
> Just change the type of field to be the correct one (like time64_t),
> together with the printf/scanf format specifiers, and be done with it.
>=20
> This way, as long as the timestamp is before 2038, it will fit into
> the existing scheme.  And on the first password change after 2038,
> additional hex digit will be written in there.  And everything is
> compatible (besides very old - at that time - versions of samba),
> and there's no need to rewrite anything.
>=20
> Mind you, smbpasswd can be on a read-only media, so rewriting it without
> someone changing their password is not a good idea.
>=20
> /mjt

Simplest fix could be to make a safer conversion using hex_uint32() and
forget about this for another 80 years for the deprecated format, by
stealing the extra bit and using unsigned 32 bit time.

The write out of the record is already using a 32 bit unsigned format.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org

