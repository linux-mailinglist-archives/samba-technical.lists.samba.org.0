Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6A790170
	for <lists+samba-technical@lfdr.de>; Fri,  1 Sep 2023 19:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=A6ODDLtOME96bI05sSU4G1/+lN1FTpf6X6ZzhgfuqBw=; b=0EXVai6L4utVXeQgUW3/lGHNWm
	hnBC51oD295YBfnyWtgMS599w00tVx41JVL4xdz7SnGPnAANN+j28grz4RGrvD2KOfxme8jXiiHAG
	IN0a7YbNSLctpaaUD78dVDekUzl1wvhxdWAiz8SNfVabMSP9S3vLANJnXhO5gym8wfh32aaCyTBBZ
	JbxU2E+uEFX3F86VwEMkf2gj3g9sR93f66lX6s0jy1100291oqulhsqKGkn0bbsq90bm7enfozZFS
	xojprZO5iP8l7ZGsZAdTtWCgqt6bUkt8wf0CFqz7m5T3Yad+9ouCFETj48LmwRdRGvAZooqGe9iIZ
	tESA5MgA==;
Received: from ip6-localhost ([::1]:56430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qc7wn-000AF6-4W; Fri, 01 Sep 2023 17:28:41 +0000
Received: from postal1.et.byu.edu ([128.187.48.31]:52732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qc7wg-000AEx-OP
 for samba-technical@lists.samba.org; Fri, 01 Sep 2023 17:28:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal1.et.byu.edu (Postfix) with ESMTP id CCF7E5EE87
 for <samba-technical@lists.samba.org>; Fri,  1 Sep 2023 11:10:28 -0600 (MDT)
Received: from postal1.et.byu.edu ([127.0.0.1])
 by localhost (postal1.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQq50i3T8Dqr for <samba-technical@lists.samba.org>;
 Fri,  1 Sep 2023 11:10:28 -0600 (MDT)
Received: from [10.35.115.21] (congo.et.byu.edu [10.35.115.21])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by postal1.et.byu.edu (Postfix) with ESMTPSA id 614725E148
 for <samba-technical@lists.samba.org>; Fri,  1 Sep 2023 11:10:28 -0600 (MDT)
Message-ID: <cf3ce5e3-2204-ea22-01e3-cae651c86ab0@et.byu.edu>
Date: Fri, 1 Sep 2023 11:10:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-US
Subject: Mount point detection by device id comparison
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Carson Buttars via samba-technical <samba-technical@lists.samba.org>
Reply-To: Carson Buttars <carson@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello all,

I have been working on a basic patch 
(https://gitlab.com/samba-team/samba/-/merge_requests/3141?commit_id=4cf70194826920482952e7d4d60d76b84885843e) 
to detect mount points and have gotten it to a working state where it 
marks a file as a reparse point, adds FILE_ATTRIBUTE_REPARSE_POINT to 
the mode, and sends IO_REPARSE_TAG_MOUNT_POINT to the client. I have 
seen that there have been some recent changes related to reparse points, 
and I'm wondering if there is a clear direction of where things are 
heading in the future. So, here are my questions:

My patch currently is making the comparison of device ids in the default 
mode function: is that the most logical place for this to happen, or is 
there somewhere better to do that?

I am a new contributor and not very familiar with the processes of 
getting a merge request accepted. Is there a route to getting more 
direct feedback and/or guidance from a more senior developer?

For me to make a patch that will work well with future changes, I'd also 
like to know: is there a clear plan of how reparse points will be 
handled in the future?

Thanks,

Carson Buttars
