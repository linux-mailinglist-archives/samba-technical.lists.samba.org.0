Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B450BD2691
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 11:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Zg/Rqss/iBP8jQf08hPmTCqF5TM0sQGepK9OZi0+DfE=; b=fxoPmvRpxVw3qtsy/AOlvyGTgv
	5dlZsIzH5hX95Nu9e4o7T9696bGy7/RoblHBsbqFSgP5TEalpzpbAGFK36FJFETtY5bm30zpNHexs
	Rgux7VHO84mZhZ5xrU/BcF9q3FiOtdT+SF5EIuKavYdIjPuk8OR2zXl07fCNlWtUVHSpq+wo4Pr68
	XCWu+y0BSivwKQeB5jRmtLCkDdHCzlvfxPOMEEhByooo0M0xyfPXgLpz+jrdTqwqufSSYssSLH/Oo
	CqWh7J+e6gjI0XuOu0VjdnXiO12aC6/CH9g1muoZ9e3WaWdvOejoXMfYhrWXNQ0YPfjwEdNzt/d9n
	sJjQOR1Q==;
Received: from localhost ([::1]:62952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIUwp-002bUW-Va; Thu, 10 Oct 2019 09:41:28 +0000
Received: from [185.16.48.59] (port=35076 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iIUwk-002bUP-Ra
 for samba-technical@lists.samba.org; Thu, 10 Oct 2019 09:41:25 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 37C7B40608
 for <samba-technical@lists.samba.org>; Thu, 10 Oct 2019 11:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570700480; bh=Zg/Rqss/iBP8jQf08hPmTCqF5TM0sQGepK9OZi0+DfE=;
 h=To:From:Subject:Date;
 b=lmTmgjKPn5AoVV52VyrddlywCtrRXFhAD0wFJkGeNX6YdC+5SaTyfe0sgOLgZAhgF
 KpearOCXSI5/4Sqz6N3RTeqo+wQDSDO1MdpOfp0SKR+6I17UKby4yKiduTFTHJvJ2Q
 gA3+tVDzfIpPfT6wL/m0GsSKUQFWuSvmKpzymfGU=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id E05E45E
 for <samba-technical@lists.samba.org>; Thu, 10 Oct 2019 11:41:26 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Bz2LbXgy9q23; Thu, 10 Oct 2019 11:41:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 4F6DB6D;
 Thu, 10 Oct 2019 11:41:26 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lRlA1Zo27oGm; Thu, 10 Oct 2019 11:41:26 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 35CC75E;
 Thu, 10 Oct 2019 11:41:26 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: samba-ad bind-dlz AXFR allow bug
Message-ID: <bf8c6483-ad14-9a72-0c66-aae6193a22c9@tranquil.it>
Date: Thu, 10 Oct 2019 11:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

I have been looking yesterday into the AXFR bug in Samba Bind-DLZ=20
module[1] (current Samba DLZ module accepts DNS zone transfer requests=20
from anybody).

There has been a fix proposed by Julien Rop=C3=A9 [2]. The patch does wor=
k as=20
expected (I have not looked into at why the pipeline did not go through).

However while fixing this bug Julien stumbled on a isc-bind bug [3],=20
which resulted in a new patch [4] which was considered as a potential=20
security issue by the Bind9 team (CVE-2019-6465).

This fix is part of Bind9 version 9.11.5 or later. However CentOS7 ships=20
version 9.11.4 with a patchset released this summer [5] which address a=20
series of bugs and security issues, but it is missing CVE-2019-6465n=20
even though the patch was already released at that time. According to=20
Redhat errata dated from February it was planned to be included in=20
future bind9 release [6].

Redhat does not ship Samba-AD, so there is no issues here with Samba=20
Bind-DLZ module as far as Redhat is concerned, however this issue also=20
affects other DLZ modules.

Do you all think this patch [4] may be going in upstream Redhat7/CentOS7=20
rpm in the near future? If I ask customers with active subscriptions to=20
report this issue, would it be quicker to be fixed?

Adding the patch to the bind9 srcrpm is not very complicated, however I=20
am not eager to ship patched rpm of bind9 along Samba packages for such=20
a small patch... Another option would be to just remove the AXFR=20
altogether in the samba bind-dlz module from our CentOS rpms for the=20
time being...

Cheers,

Denis

[1] https://bugzilla.samba.org/show_bug.cgi?id=3D9634
[2] https://gitlab.com/samba-team/samba/merge_requests/169#note_194230102
[3] https://gitlab.isc.org/isc-projects/bind9/issues/790
[4]=20
https://gitlab.isc.org/isc-projects/bind9/commit/a9307de85e147f4756c75d15=
aa221d2262df7d67
[5] https://access.redhat.com/errata/RHSA-2019:2057
[6] https://access.redhat.com/security/cve/cve-2019-6465

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

