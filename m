Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3D302BD
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 21:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=J5MK9M51Blx3CZPGi/h8g0OO6bTk51aIsSKfpkOQH1A=; b=e3lxf9tPCsuyj419N//kOINldl
	1rvnWEN3ZZd+t1+NyDV+/Ct943RtAeuO7777C5Zi2D+FCLZu7QG9DZsXqJHj4IfdpK38HY11AoJk3
	plzFa4OQB8uzulcMosEnhtVPewb3Q1le3ueZOLveYmS2Mlb/v38Cg0WCBaMJgspsSSzkHDlpQOvPy
	zKNZc8eko75Z2CMjV7zzoeG/nDKwWS9mQnD35oyZo28R1fheHq6YKuJoOBNnEMtviiDhQ5VnRxN6p
	P75lWFAEMeG0oKR/3SbTpxvL6jFFEp6Cvfm3Vf3993Ju3ON34SeoqA3xD8fp0cnhlRL5h+PaJnMlx
	dKSt7V4w==;
Received: from localhost ([::1]:39892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWQed-002eSR-VF; Thu, 30 May 2019 19:24:00 +0000
Received: from [2a01:4f8:192:486::147:1] (port=11906 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWQeZ-002eS0-SL
 for samba-technical@lists.samba.org; Thu, 30 May 2019 19:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=J5MK9M51Blx3CZPGi/h8g0OO6bTk51aIsSKfpkOQH1A=; b=HEcVL0WHX64datbkdTNfkc83Xo
 Tk7iaRLSoWzmy+ugs1Epeq/mS0n1p+5f///E+IUYiLs3fVNvyVsglM7XkzinW8lWMyjybQcU+aNYH
 ++V698FLsTK8Kf0/UyQMAXGVQKZktcL3E/bsbkMZGmmRp5oXHyBRK+6ycUbWB1XQfArA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hWQeT-0007FD-Nv; Thu, 30 May 2019 19:23:50 +0000
Message-ID: <856407b81aafc7a95e1692488d17c092b014eacb.camel@samba.org>
Subject: Re: sambadowngradedatabase (Re: [SCM] Samba Shared Repository -
 branch master updated)
To: Stefan Metzmacher <metze@samba.org>
Date: Fri, 31 May 2019 07:23:45 +1200
In-Reply-To: <3d4b6b06-ce22-a0ad-cca0-0abe6aa88035@samba.org>
References: <20190529055804.559BC140235@sn.samba.org>
 <3d4b6b06-ce22-a0ad-cca0-0abe6aa88035@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Wed, 2019-05-29 at 13:06 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
> 
> can you please prepare backports of the sambadowngradedatabase
> changes?
> These are needed in the old branches.

I've made a start with the fixes to avoid segfaults (4.9) and also to
print a better message (4.10).  

I plan to backport the undoguidindex (and rename to
sambadowngradedatabase) to 4.10 and perhaps 4.9 once I make a change in
master to ease the backport.  (Revert the change to TestCaseInTempDir)

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



