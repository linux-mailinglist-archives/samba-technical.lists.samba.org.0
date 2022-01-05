Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18003485B72
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jan 2022 23:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=TmvP35lBCJVzbGA9I0Z3nAbLB7Etz1LNmS4YF3amkGE=; b=cn2Sy6xc1mjpWxmkihuDXKCahg
	jiDEME50c4ZL88C7v3o/s/x0z6wMHRtAtaTzJd8dj5dZ8Aj8bFnfSk4RUdF3VpssbuqmL7tcQqIm5
	GfsVUI4/0n/tTnSK+b54LA8J20XT8p9He/rf/g1dUQjZqqju1xvxTxgGNI+ALZ03YyzWIKz6eBTZI
	imLYwtN4RhSpb0aggpy67TsuDRmah3jqwb2iP+2YhDsoumHIHY3mX9PguNsNWB//95/RzNTN17t8C
	yFJh1FDGkCCfp63IYg9KfaXevW9IzvwaH2ZE42bJfOLsLwMCby3N1M/TbuglOgTHHX2RowxRZSDzJ
	Dzx8tnsQ==;
Received: from ip6-localhost ([::1]:49576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n5EWr-0056rB-Ss; Wed, 05 Jan 2022 22:13:09 +0000
Received: from postal1.et.byu.edu ([128.187.48.31]:47152) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n5EWl-0056qz-2s
 for samba-technical@lists.samba.org; Wed, 05 Jan 2022 22:13:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal1.et.byu.edu (Postfix) with ESMTP id 2E8885EE95
 for <samba-technical@lists.samba.org>; Wed,  5 Jan 2022 14:56:59 -0700 (MST)
Received: from postal1.et.byu.edu ([127.0.0.1])
 by localhost (postal1.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMO8OcFEXXJN for <samba-technical@lists.samba.org>;
 Wed,  5 Jan 2022 14:56:58 -0700 (MST)
Received: from congo.et.byu.edu (congo.et.byu.edu [10.35.115.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by postal1.et.byu.edu (Postfix) with ESMTPSA id E637B5EE87
 for <samba-technical@lists.samba.org>; Wed,  5 Jan 2022 14:56:58 -0700 (MST)
To: samba-technical@lists.samba.org
Subject: Unbecome Root in VFS Module
Message-ID: <f48481ea-1c2c-51fc-89a3-c7c81b97e48d@et.byu.edu>
Date: Wed, 5 Jan 2022 14:56:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Orion via samba-technical <samba-technical@lists.samba.org>
Reply-To: Orion <orion@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

While adding NFS RQUOTA V2 support to Samba, the request is being made 
as root and is thus root squashed by the server and fails.

The reason for the issue is source3/smbd/quotas.c executing 
become_root() before calling the VFS module.

I tried calling unbecome_root() within the module, but it did not work. 
Is there another way to change back to normal UID/GID from within the 
VFS module?


Thanks,

Orion


