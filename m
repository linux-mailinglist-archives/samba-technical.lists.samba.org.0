Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D3F1DB
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 10:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=T88YzDCfdRRpRnlKh43Qlc+b4mJ+OnfqC7S9nbpXuZ4=; b=p+Oxnz3LbQ2ec99QwUKaxfjoqJ
	UoauxRBefish+UPdRhbtSt0C0WeVJZf1ViJ0k5mUa/igsjbLu4CDMcQ6FCNy096ErhKkgZmPYHxGc
	LZrGIcT75K7qteiHNDaNAu8s5Ot2ThOtGrRLgoypZpraqIFKrQFadccuxowg66XyDbTG5SBysT+f+
	slCMWAUw+j1y3hmSYndkCpyE9JzB72Iu3mcb2HKhbIBG+5vedMWQnKRremJAC6/mejdXV2ftc971u
	aI/LlLWZe36zuS5/ffLmwSbMnjQZtQzMNTdn5lIJ8tQ92pmpPWLwMssYkDpaDjEpF4zQi1nOyGrvU
	8lttComQ==;
Received: from localhost ([::1]:31574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLNsV-003oV6-Kh; Tue, 30 Apr 2019 08:12:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:41264) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLNsS-003oUz-9o
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 08:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=T88YzDCfdRRpRnlKh43Qlc+b4mJ+OnfqC7S9nbpXuZ4=; b=vRiWb9BVLTIgVJWYF6dRmg4j1O
 OuaXFf1xgG0vm7zCykhRGQq+Wnk3wqEGX3Z6jKjOkxlxf/slageYACYHNUztf2tPU0RN0nUx11etp
 xn/V34kkhZQYMz70PCshtVFwhHyfoTADViapzv2xUWTpOQG+MJ8NgxEbMSa289jy+b+E=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLNsR-00080O-Bz; Tue, 30 Apr 2019 08:12:35 +0000
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Amir Goldstein <amir73il@gmail.com>,
 Pavel Shilovskiy <pshilov@microsoft.com>
References: <CAOQ4uxjQdLrZXkpP30Pq_=Cckcb=mADrEwQUXmsG92r-gn2y5w@mail.gmail.com>
 <CAOQ4uxhuxoEsoBbvenJ8eLGstPc4AH-msrxDC-tBFRhvDxRSNg@mail.gmail.com>
 <20190426145006.GD25827@fieldses.org>
 <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
 <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
 <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
 <CAOQ4uxi6fQdp_RQKHp-i6Q-m-G1+384_DafF3QzYcUq4guLd6w@mail.gmail.com>
 <1d5265510116ece75d6eb7af6314e6709e551c6e.camel@hammerspace.com>
 <CAOQ4uxjUBRt99efZMY8EV6SAH+9eyf6t82uQuKWHQ56yjpjqMw@mail.gmail.com>
 <95bc6ace0f46a1b1a38de9b536ce74faaa460182.camel@hammerspace.com>
 <CAOQ4uxhQOLZ_Hyrnvu56iERPZ7CwfKti2U+OgyaXjM9acCN2LQ@mail.gmail.com>
 <b4ee6b6f5544114c3974790a784c3e784e617ccf.camel@hammerspace.com>
 <bc2f04c55ba9290fc48d5f2b909262171ca6a19f.camel@kernel.org>
 <BYAPR21MB1303596634461C7D46B0A773B6390@BYAPR21MB1303.namprd21.prod.outlook.com>
 <CAOQ4uxirAW91yUe1nQUPPmarmMSxr_pco8NqKWB4srwyvgnRRA@mail.gmail.com>
Openpgp: preference=signencrypt
Message-ID: <677e86ee-59b9-0826-481f-955074d164ed@samba.org>
Date: Tue, 30 Apr 2019 11:12:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxirAW91yUe1nQUPPmarmMSxr_pco8NqKWB4srwyvgnRRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeff Layton <jlayton@kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/30/19 3:31 AM, Amir Goldstein via samba-technical wrote:
>>
>> About O_DENYDELETE: I don't understand how we may reach a good interop story without a proper implementation of this flag. Windows apps may set it and Samba needs to respect it. If an NFS client removes such an opened file, what will Samba tell the Windows client?
>>
> 
> Samba will tell the Windows client:
> "Sorry, my administrator has decided to trade off interop with nfs on
> share modes,
> with DENY_DELETE functionality, so I cannot grant you DENY_DELETE that you
> requested."
> Not sure if that is workable. Samba developers need to chime in.
> 
> Thanks,
> Amir.
> 

On Windows you don't ask for DENY_DELETE, you get it by default unless
you ask to *allow* deletion. If you fopen() a file, even for
reading-only, the MSVC standard C library would open it with delete
denied because it does not explicitly request to allow it. My guess is
that runtimes of other high-level languages behave that way too on
Windows. That means pretty much everything would stop working.

Thanks,
Uri.

