Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE477A8937
	for <lists+samba-technical@lfdr.de>; Wed, 20 Sep 2023 18:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rGvIux/6iP2rwKpT4xScJdPk33yQFe640DA3H0AMGZM=; b=etzcCuezcl5UOQKdiukHnmaclF
	ZTiOdci9dinJHM53wE76a94m6lLF5zMrYwKB1vlgsyylWpYQEBPZ5rvrmPi+BAxBEY8zfvp9r+lw5
	t96ph3Gmi9mcVKE2rm5BLBgrFkpdF26elpgk0OOxBQUomSIIKXoibwSrPPRk4FhfdO2RinMJ0Y+Ux
	57zFEBbGqF1vMfOM+ExyFQ3owUgxNftF/6HhvBnbvr3cOLXzvoisZAJ+YmWq0no7i1SCHY1Qm+9Q+
	0aPPJjBsR/YEjRqftPmXB+Hd14WsjY94LL3SM/dGTN7hLL+TMgqWFeMaseWKr0Tiaa3sq4bjtUivl
	GrlEgk7w==;
Received: from ip6-localhost ([::1]:49252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qizeg-005VSr-5h; Wed, 20 Sep 2023 16:02:22 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:34398) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qizea-005VSg-Uf
 for samba-technical@lists.samba.org; Wed, 20 Sep 2023 16:02:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id 2599A6E0F1
 for <samba-technical@lists.samba.org>; Wed, 20 Sep 2023 10:02:10 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOxS6a7nkF0B for <samba-technical@lists.samba.org>;
 Wed, 20 Sep 2023 10:02:09 -0600 (MDT)
Received: from [10.35.115.21] (congo.et.byu.edu [10.35.115.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id E2D296E0EE
 for <samba-technical@lists.samba.org>; Wed, 20 Sep 2023 10:02:09 -0600 (MDT)
Message-ID: <242580f2-8a90-7bab-3702-5ff7ea9adc98@et.byu.edu>
Date: Wed, 20 Sep 2023 10:02:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Mount point detection by device id comparison
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <cf3ce5e3-2204-ea22-01e3-cae651c86ab0@et.byu.edu>
In-Reply-To: <cf3ce5e3-2204-ea22-01e3-cae651c86ab0@et.byu.edu>
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

I've gotten no response on this. Is the right place to talk about it on 
matrix?

Thanks,

Carson Buttars

On 9/1/23 11:10, Carson Buttars via samba-technical wrote:
> Hello all,
>
> I have been working on a basic patch 
> (https://gitlab.com/samba-team/samba/-/merge_requests/3141?commit_id=4cf70194826920482952e7d4d60d76b84885843e) 
> to detect mount points and have gotten it to a working state where it 
> marks a file as a reparse point, adds FILE_ATTRIBUTE_REPARSE_POINT to 
> the mode, and sends IO_REPARSE_TAG_MOUNT_POINT to the client. I have 
> seen that there have been some recent changes related to reparse 
> points, and I'm wondering if there is a clear direction of where 
> things are heading in the future. So, here are my questions:
>
> My patch currently is making the comparison of device ids in the 
> default mode function: is that the most logical place for this to 
> happen, or is there somewhere better to do that?
>
> I am a new contributor and not very familiar with the processes of 
> getting a merge request accepted. Is there a route to getting more 
> direct feedback and/or guidance from a more senior developer?
>
> For me to make a patch that will work well with future changes, I'd 
> also like to know: is there a clear plan of how reparse points will be 
> handled in the future?
>
> Thanks,
>
> Carson Buttars
>
