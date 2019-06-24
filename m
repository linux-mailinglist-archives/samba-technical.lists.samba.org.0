Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADAB50402
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 09:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=j7nqw8wubq/YDkG7klYEUKxakPId7KzYf6yMlivR9Bc=; b=Ov9o9+0PxOCrbAY3TtLuRb546P
	9l4AjNQZCaks117fYkOmf6WuOc1yAcjaJrQ8ittTCAIb81wLXEcLhTQadKV6PWUD3j6Zj8wnCRxBv
	HOXGaUDlNOc/0cexmJBFuIWfxc3YYssgXnDqejf5yXdOPJA3SQlqSYUV+Gjz0TgejbciYTand9+sl
	fWpfV/L352BQ7ynvc7JhM2rZc4yeCrrA7/WZ/KwoLR+pYaxHNHw1r6j7IuV5gx2qqYp5mJPGVS1l+
	Pr1QzHKz5q4EEYZalEk957041aE2KSGVWFQ5kXOeeCEykGS7QkC/Q5bYzUHDuaNMN2UglFmwArf5k
	EMqGBrdQ==;
Received: from localhost ([::1]:32786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfJoZ-001Odr-2O; Mon, 24 Jun 2019 07:54:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51062) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfJoT-001Odk-Qm
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 07:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=j7nqw8wubq/YDkG7klYEUKxakPId7KzYf6yMlivR9Bc=; b=Jmnua37vMCcF7CNLKXVoMKl/md
 um2YbjUytYLij9lg3W9vGUtig8I5c1euzdLK1cblcbqnFqgb/0UGVMxux0taA/Pj9HqoF+z5C/aNu
 mm80Cqr5w7B2a96/h7Jzh3D6RfIXOxMmrsSkKjb2FYniLm3JOC6sieT6UWx9Mg3gz638=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfJoS-0002fW-Iy; Mon, 24 Jun 2019 07:54:52 +0000
Subject: Re: Can we RESOLVED/FIXED
 https://bugzilla.samba.org/show_bug.cgi?id=13142 <EOM>
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
References: <7b698bfa-3f52-14b9-32ee-f914f49fbf5e@redhat.com>
Message-ID: <bbfc2ea5-871f-3ddd-2d77-6acec6aa7946@samba.org>
Date: Mon, 24 Jun 2019 09:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7b698bfa-3f52-14b9-32ee-f914f49fbf5e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

done. Thanks!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

