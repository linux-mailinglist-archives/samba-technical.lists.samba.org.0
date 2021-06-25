Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B43B4531
	for <lists+samba-technical@lfdr.de>; Fri, 25 Jun 2021 15:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=u5yD8H0Z0aLDh4yQCEHFIffZz8QBlO3ybYjM9lTjF7s=; b=UUTEFCF1yM8AZNy1JdAXwQsZ8a
	tSdhW8k0t5bCc2KhaIlONmaIWK5biuAOLY/ujSYEBh1PkJmOaDiM8yDeNdSUva7hULplKZxoSJqmq
	IVwy7WLf8tYu/mD44I9yXZwB8rGx6RCsf+RxM0El0YmCLXJtQiBmnEc3fLSWTC7+taUAoh4JWFpUy
	LWoSOunh7NLHAXzH1g/oEzUoFn3wNd4Qk5m5/odo82Rpulk4Z9JSb8RiyfrMdf14oS3T5Jg2w68TE
	WCvZUh6uIT4bNkZukNlFVkL9hURDXucCV6QzzI5iSHp1TbF3QVa9cpT9DOe9t3oPzSvl70q2Tsiif
	I0fd62RA==;
Received: from ip6-localhost ([::1]:31084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lwmM5-008OkV-Eq; Fri, 25 Jun 2021 13:58:49 +0000
Received: from air.basealt.ru ([194.107.17.39]:50078) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lwmLy-008OkL-9V
 for samba-technical@lists.samba.org; Fri, 25 Jun 2021 13:58:44 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id E063D589433; Fri, 25 Jun 2021 13:58:38 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 0B254589425
 for <samba-technical@lists.samba.org>; Fri, 25 Jun 2021 13:58:36 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: How to change the value returned from lp_state_directory() in Python?
Organization: BaseALT
Message-ID: <26233b43-512e-1a78-c109-2fb28c153645@basealt.ru>
Date: Fri, 25 Jun 2021 17:58:36 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

I'm working on MR: 
https://gitlab.com/samba-team/samba/-/merge_requests/2042 and I'm 
experiencing issue with tests using registry.tdb file. I use 
reg_open_samba3() function which finds registry.tdb file using 
lp_state_directory(). The tests are failing on CI because no such file 
is present in STATEDIR. Is there any way to change STATEDIR in runtime? 
Preferrably from Python.

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

