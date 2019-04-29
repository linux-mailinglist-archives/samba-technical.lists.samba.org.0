Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE891EBB8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 22:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=e3ctk1HLt31U+rKqU1ENUhYekthOkLQ8J9lP38UPfGA=; b=dOHVt2O0wc6/t/qOULjJ31TZsz
	AXCvRJGKhILjALfKQb6F6V8vZi+bbl/BmEol71aFE4tHBD7YK0TxtRKFvWoOHugnfp1jRBW+JiIFl
	cuWNZdsL7ZWuykI8/cKsYc0CTMWJpjpq4I2yF4emQEAvliB89N9ZnvixKshZfxFlD0zoZnN9sGp57
	ZU0ZBi0gPXKaNsUQPl6mQkCvwiZXQPg3biH+bA4lskM2P/EwWeOsbR1HqhoVhobVhb09ms12J42WR
	/LPyOo8KLRPnjZL4enptRVHNLB6RrT9sBYHBQEkw72HpsiKJID1/SKCNTHjQRAV5myHuq0jZGdKG9
	uutKD10w==;
Received: from localhost ([::1]:56352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLD1e-003krc-70; Mon, 29 Apr 2019 20:37:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:31814) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLD1a-003krB-5X
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 20:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=To:Message-Id:Cc:Date:From;
 bh=e3ctk1HLt31U+rKqU1ENUhYekthOkLQ8J9lP38UPfGA=; b=Tr2dWiiB52gco948fJV5uv0TcP
 gyi/yoG8xIVa5gwdT8kcSr2OHpSOP/YuAZQFUTUw6b0w6ZYbbqHpfecpgYN9pJnurY/nIaEEQW13s
 aI35szCrXgaqHd1Sd/uTlDWNTZsi3klFOFALCj9F2aPUYRuKNpyNQ4+5Mmy1zQAZwdKY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLD1U-0000Xl-0s; Mon, 29 Apr 2019 20:37:12 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH] use current working directory instead of share path in
 cephwrap_realpath
In-Reply-To: <20190426204104.GA82610@jra4>
Date: Mon, 29 Apr 2019 22:37:11 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E2F31D6-C2BE-4CF0-B486-E82B73B6E086@samba.org>
References: <2ccf782c-f2fe-2ed7-23b6-fdf336b1d172@heinlein-support.de>
 <20190426204104.GA82610@jra4>
To: Robert Sander <r.sander@heinlein-support.de>
X-Mailer: Apple Mail (2.3445.102.3)
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
From: =?utf-8?Q?Ralph_B=C3=B6hme?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ralph_B=C3=B6hme?= <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> Am 26.04.2019 um 22:41 schrieb Jeremy Allison via samba-technical =
<samba-technical@lists.samba.org>:
>=20
> On Fri, Apr 26, 2019 at 10:36:24PM +0200, Robert Sander via =
samba-technical wrote:
>> Hi,
>>=20
>> reading symbolic links from a CephFS via vfs_ceph does not always =
work.
>> It looks like the CWD instead of the share path should be used to
>> construct the real path.
>=20
> Yes, that's completely correct. Thanks a *LOT* for catching
> that. I'll log a bug to track.
>=20
> We now change to $cwd to prevent symlink races
> so handle->conn->connectpath isn't always the
> directory we're in anymore.
>=20
>> Attached is a patch that changes this. Please review.
>=20
> RB+. Can I get a second Team reviewer please ?

+1

Robert, your patch is missing a Signed-off tag. Can you please check out

https://wiki.samba.org/index.php/CodeReview#commit_message_tags

and let us know if you're happy with one of us adding the tag on your =
behalf? You may as well update the patch and resubmit to the list. :)

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


