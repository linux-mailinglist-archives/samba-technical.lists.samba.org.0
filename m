Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C81C6B22
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 10:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9n6p0rkof0L3IUs/OYyOVdd5ETk2m7WqJgQ1jjmYRVk=; b=1QGM97MqUNgBqv/Daqijdj7oL2
	O64Udx4/ffWO/8h0TNR6FANmw5q7PACTF2/BgqnMFRS88DKU7i9xasjOMjo4cVF4JKguOG17AlP4H
	WurevhLC1SBoDrlCeM26Jqclr4CTMExQ+FqFszTDlfVTGhgceQS+Ek9X4VVCmz37c74N2hU9l65Iw
	OV42Y9QtdDZkdMbIHmz5IXMTL3y+BGUjgT1s4XrxAFTEjhvt8qFKEobSxh7MkgtqcBJxui3SD46X0
	sQjOQvTJdO0v1e3Yld5gaIUNSqaF/FSEZVxfc2WatAB7W/WvtxuMqew/zFwb9myzgQog/zteuKfEi
	fLkP/K9A==;
Received: from localhost ([::1]:35256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWF8z-002zTZ-HE; Wed, 06 May 2020 08:11:05 +0000
Received: from sonic308-17.consmr.mail.ir2.yahoo.com ([77.238.178.145]:42204) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1jWF8l-002zTS-7I
 for samba-technical@lists.samba.org; Wed, 06 May 2020 08:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1588752646; bh=9n6p0rkof0L3IUs/OYyOVdd5ETk2m7WqJgQ1jjmYRVk=;
 h=To:From:Subject:Date:References:From:Subject;
 b=AuT6gfiPq1DP312jNnbPuIG5pvNvwky4d9ep/kNJHwmUpdc2e8XGhn/0vSCKxr0LMdiiVaAht6gBvp9evV8NPZjZ7PVEewbFTXv79fh56FotYDp8K6KghrFBpWuQlCaqf1bxqMiVhtZaALmjnq49uJsYytjvgOCZ3MJd+QszOEEq6ef7WiyKMmGaLtiscYISQOqIK8loGYW7xL/QwIrSyRoEk8DMwWhAPL2y2g1iuJC1Pl4iDNbulY1rCIRGeM7SUo/E0aFa0RlgeJRvBNyAQ0j8fzYyCO4EuJq9BxZr9LGOAJ/8GKsWBkOTGe2UlygIClDobYC/H2QKO8liZP7V4Q==
X-YMail-OSG: aXwQZfcVM1lkzY.ositVoupHIBO5izJl.QlFWVUo0bpcPb1FGkBzXJJYmY2CEt_
 18eibBKZieohz7WKT5jZIOI1NVgaSKTZ26Vj.cZyDi1Q84xvgKa_gBCI6q5fj.3vHobvpPGBSn8w
 pUkfIKd_mNyU7wDtsMlPfPjBh_6IfJc4CBgA_hb_YYydkYlIZllz0O.YxEtBjJfp7MWdRnK_YPDR
 xhQfmF9scMvQXHd4W1wsKmqMwUnb1h_WnBrKhkNDJBtZ_VPgSQTQngcINBk7qvFCUbHP32cAJe5Z
 W3EOBTy_6D62inG4XzmJcC3mrNrozIyTMonAiah_dnr7fZfp6i7oO.RXJ7QkVFXeUe9O0iw.YDti
 QLmGvNs0fcJ0UXo4nmahIGWfXpDVnefHNHJBuABG0iafz0oTnHTDDHWMBLwvsQXUoeRcIIrySQ6a
 XTvMWhOrj.RJrYkKz1_EO9XVAvTHSQCiviJAf4Q8fvklNeZubvXcMfnaOb1BKEvNC0lwnxvNyAdj
 syB4HugwrfddzRFWiWAPUsljFS8AjG9xbKgMkjJV58stbQDbfAj016x2pDpTlOOwaeyk5NZjOEs7
 .HrUhXE0PpCBbdTcLeFa5LjXFTzuOhWOPF2ZeaMow70ek_1S6j6u8sY.ZtpKt3932D5eYT9Ax80.
 A.LthuY_w49xk7JOR4F4ce54seasvLNwyjwvs4Hc8l6AAyZwbyK9ZvnHhnOj9TlQQvLDll1tV_Il
 iYT7e31zWvOdhQgFpUXMSpJLkcUa3PPW0WQtW39W_b6rXI_BJq82r8D2LfJW9SC_dP4xlyE79rHI
 K.bcLtKaOfRzxknPVItFTC_LhjQM0afqCk0Yrt0Ev9WUZeTvK7IXnRaVnCGfuZ7l0LWWp6S_3dN9
 EBX3fYHvuYyyLdlmO3YmSIujow7UnotGrXsUkahP0TJ3bRsXVpw.iSMeWKk3npzmTk4yWduBKGax
 dl9jk4w6iMnd7uOM.GzpY6x73fqIrPvbNPtBUUWChWmqw0T9TkSnVzL4XNQVyTrOJg6PQHlNZv2V
 qiUVdBkKicqrrSs6s7vXrz9ejeDmZ_FjJRnsvM6WsyPDho4F8zq.QmZw0x4I7vaVTx2RNtrX.fem
 DwOoATME_iwz2uHX2eCOBCg.7UfOcNeWGGUSWOxWBAI.NjqjqoueuIFeI.bD9b3Ci.R7omoJ5yBE
 .dxeurJEZv24rsNoODBFct7ZUEtoC6E0slB0SM0_YQgGNg8RZtlBUdROVvh8PtEGcVZnLDKJg.N5
 6ygXq8dufSnfX7RuVpgLtLpuozuBu0XdAzUWDIvtLGO0pEqkVjq.EJU4iD_7c4xFhOkRyo1uRv7T
 W5svsENS2R8QdZJ6_65m5VtdHEhC8orkLZI_x3X5uxNAY_dP.pAR2rSF4.0AQfWy.roJmkc0_8fz
 P
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Wed, 6 May 2020 08:10:46 +0000
Received: by smtp410.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 63ea6bf4d97199c80d74a8a0802773fe; 
 Wed, 06 May 2020 08:00:36 +0000 (UTC)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Samba with GlusterFS - the bug is back?
X-Pep-Version: 2.0
Message-ID: <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
Date: Wed, 6 May 2020 09:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
References: <4b3fdecf-e666-dd76-d618-0150b2549f07.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
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
From: lejeczek via samba-technical <samba-technical@lists.samba.org>
Reply-To: lejeczek <peljasz@yahoo.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi guys,

I fear this or very similar - https://bugzilla.samba.org/show_bug.cgi?id=3D=
13585 - is back and I wonder(must be no me alone): would that be(if this =
same old bug) Centos maintainers' fuckup or it's in the upstream?
samba-4.10.4-10.el7.x86_64
glusterfs-server-6.9-1.el7.x86_64
If anybody here is a glusterfs mail list consumer, then it's "Unable to c=
reate new files or folders using samba and vfs_glusterfs"

I'll say this is a small catastrophe, once again, for all those of us who=
 run with glusterfs.
Would you have advice with a quick fix and/or workaround?
many thanks, L.



