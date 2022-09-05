Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119C5AD9B2
	for <lists+samba-technical@lfdr.de>; Mon,  5 Sep 2022 21:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pcB6SZ5fescp8Ia4xgKWad/9aY/3YzuWpVWRlcizHf4=; b=k5KvTOeAnohZ4hs7iyQBRCB9lK
	E1mVEKZuA/Tvn91cehSzULoNITARVnPKK9eAsi5IYMk/32OEaNWdnBLgc5JqC9nkzJvNAUIXo2C+w
	77h90hN+wkhtdexm6EzVV0CxXMiT/d4PPr6t4YSWrGygv3ZhmAH5LWMTd0+vBY6p90qd3d1fQ0+jl
	lqzyDcMSR+37WU7SFgDFv9UpJTJvExY28KYJTrA7YBJbqe2SDvblsZfxe+HOB9bYFV+pdrLq+0PIi
	Nufhd//uHIOstXnCRhZHWCJhrr/FRlnOq5WkKrZIeGcdGYV3mCPHr8CKda/jgPIicAlRn2dZq8utX
	wzZIMZyw==;
Received: from ip6-localhost ([::1]:52674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oVHrN-005bcX-MZ; Mon, 05 Sep 2022 19:34:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13660) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oVHrI-005bcO-1Y
 for samba-technical@lists.samba.org; Mon, 05 Sep 2022 19:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=gFmsKKxdCCtFHqaCKftDqGyL5MGoz0WRwdoD3JY36Lo=; b=NMwWpEeI5kgYqJx7D7CeGBNeW/
 Ddq4vxojRfxy05uRgid0cMKVyts81Fi/f9ZNvEiAo32uWTOo4Rnd0nlKZel8z1GGCvhpjcUUveU2u
 ehNGwQSfp7ZPgiylSLpcuj/M67N180HFWWZBPshE2JVZ56jrzn+f2nqTeM6d643rzoYijc/URBDQz
 93AqBjTpsZOko8nupVMvK2PjvFcrmKGDLKIXmARQVVXM5WrnISbu8D/IfkkeG4P0fMscJr4KQ0Lxc
 02nA9SrmxcohC7sX5L9uoYMZ70u/gvYod5FFd5eLKbCz4sIAtl0jVpS/L1Io60+yDiB6kduX32kvl
 8ll43CW2pfmIL8zVGbQXj22lzTvP90GbChdBDVDJ0qfneblYVVMAUId5S2oHSUn64ODjZk9JA8e9L
 +91KboYJQi2rMY+FsJaor3VJvB35ZUp5gGGRg1lD+AdssWrHs5GZ4vsDfTii4YzOyh4AyP45u3MXy
 iM9L4EO4YQMSxhMYg2HbDj0U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oVHrG-003EaI-JY; Mon, 05 Sep 2022 19:34:11 +0000
Message-ID: <221eb5788b13cebb6eff3514863407dad9aca07a.camel@samba.org>
Subject: Re: Phantom samba-tool option
To: Jeremy Allison <jra@samba.org>, Rowland Penny <rpenny@samba.org>
Date: Tue, 06 Sep 2022 07:34:07 +1200
In-Reply-To: <Ywj87hCJ2MG7l5IS@jeremy-acer>
References: <e3eeb1eda243c5cd80260add048423173c2b0b32.camel@samba.org>
 <Ywj87hCJ2MG7l5IS@jeremy-acer>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-08-26 at 10:03 -0700, Jeremy Allison via samba-technical
wrote:
>=20
> So I think maybe we need to duplicate this section without
> the -A text as a new ENTITY cmdline.samba-tool.credentials.user
> and include that inside manpages/samba-tool.8.xml instead of
> cmdline.common.credentials.user.
>=20
> I'm CC:ing this to samba-technical for opinions from the
> rest of the Team, and I also think you should log a bug
> so we can track it.
>=20
> Thanks ! Jeremy.

Or we would add the feature. =C2=A0Perhaps somebody can take over this MR
and split it up as requested so it can be reviewed?

https://gitlab.com/samba-team/samba/-/merge_requests/2468

Andrew,

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

