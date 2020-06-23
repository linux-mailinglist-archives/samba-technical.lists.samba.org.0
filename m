Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE2205865
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 19:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RFemzp4UW/aKjM+dbZN9+4MV1kFdlggi5yxdzMoMTao=; b=bjo2V211BqmzCgXUxdfXoQzjKb
	DF6zVp85G/T/gbDgy1wgtZne2dfH0Bt5TjiPXSiRvJxZw03EFA7GTxdYsYh+iqEoiH99D+bXX0wW5
	bAXWB48Bnsm2mTUmhv6fCSr2KjbK8P75cKEL7Pl5BV7NP38v0kYNdEY5uwsvD+8EU0/QioPyKImuy
	buDL/BfKHEaZisABAn2b+Uq5vcpCBXVPKMPh1UGlj7fso6EZFMs1lwVrevN1eHcTd1LztxNQStQaX
	Tyh2f0dURfMJV7lMFNXQN1FDGKTaWW88MqZQgvGkT29sQmXzESyxY4QgpoiqblKBb6xljhXPBjYEO
	16KZ1U9Q==;
Received: from localhost ([::1]:18472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnmYj-0022df-CR; Tue, 23 Jun 2020 17:18:09 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:44481) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnmYc-0022dY-46
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 17:18:04 +0000
Received: by mail-yb1-xb41.google.com with SMTP id n123so11239179ybf.11
 for <samba-technical@lists.samba.org>; Tue, 23 Jun 2020 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFemzp4UW/aKjM+dbZN9+4MV1kFdlggi5yxdzMoMTao=;
 b=CnQikyWSl4ZZw8Sk5AKkhJAUS8xzII2aqx5/RoKtU6sVIxXPJZ3x1bN2ySXX21ekpK
 i9BEFeHZAvS/ck7DGSlALBaUrVHn+1dFEV1rX20FmkriLV1GMS2IR4UvoPMcReza0mox
 FnrE0B6j5l4IzezfWp8IBr0rmj18MNoXQKrtSrc8JhaqCr8Q4HFgf0cyGqlG7GWadHsQ
 49OmmfmsrjAjgnfPoT7Fa67S1/1lomY1q0RLfdyzHHxSI9mkBXRBIyLqnrPgvEs4bJBs
 qVCj+sXk1ohg03cqBxhhw0/6pWRjIXOsOuTXkZhpkoNAKjiYOE/z8uNlvHt1wwqOS8q/
 gCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFemzp4UW/aKjM+dbZN9+4MV1kFdlggi5yxdzMoMTao=;
 b=dbKExrkE70sP8muAHZsQNoVoBgOyPzWzohnJYBsE/Cm4FtnOJSV+TOO5OiN5aOs9QA
 zqr5Arjl/Rft+ITBHp4veYdbxy2dOvt/O/Y3etx3MvEPCyJkYecvKzYfTiEezA5y0um3
 u7eKXHlSaavDTpsmifHpahfrd9x7km5JpgfbPOz67ZYoYFQRFFiL4A+g6zxFY5EEe769
 wSAWlE3q/EnMq9cGRjfxsLENVAmzIO17dybocC8qlXDrD0EkiPmvNs6YHzdoUb5nCx6M
 VFmSlV/sjSkiA82wBAjUT4gZB1mjF9gzEWh4sdcY5PKmlCSOlh/SgmKLRmbz44XlWyTD
 B+sQ==
X-Gm-Message-State: AOAM530izWWwsvFZDRW+G0hlEsGRXLO6EJ8shZp0kAT7fHtbUvnK4jEp
 0QCcr2vfwdNbHcAhlOMZoJ0eozfSFkHGYpfECp8=
X-Google-Smtp-Source: ABdhPJwz6yJgYNUMtZ017iy1zR2rcW/mdvME2h0s49B7GDdfYDN563cOyAMWZlaIBkt8IAj3cono42aURQuQSyh6XP4=
X-Received: by 2002:a25:3bd8:: with SMTP id
 i207mr36253402yba.167.1592932680276; 
 Tue, 23 Jun 2020 10:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200623113154.2629513-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20200623113154.2629513-1-zhangxiaoxu5@huawei.com>
Date: Tue, 23 Jun 2020 12:17:49 -0500
Message-ID: <CAH2r5muBJqRjkYcWsSH1c-BE2kHiTxPDcMdmNwEoVPmXxWmhEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cifs: Fix data insonsistent when fallocate
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged the four patches into cifs-2.6.git for-next and running tests now

FYI - the git commit ids referenced in the patch descriptions
(although they appear correct) are not in a form that checkpatch
recognizes.  I ignored that warning since the ids are correct.
Probably not worth changing but FYI for future patches.

Thx - these look helpful.   I will try to update the xfstesting
cifs.ko wiki page on Samba.org with the results ... there are probably
another 10+ xfstests we can add to the buildbot beyond these
(especially with modefromsid/idsfromsid and with swap over smb3 mounts
etc.).  There are also additional tests that could be enabled with
changesets to allow more fallocate options to be supported

On Tue, Jun 23, 2020 at 6:33 AM Zhang Xiaoxu <zhangxiaoxu5@huawei.com> wrote:
>
> *** BLURB HERE ***
> v1->v2:
>   1. add fixes and cc:stable
>   2. punch hole fix address xfstests generic/316 failed
>
> Zhang Xiaoxu (2):
>   cifs/smb3: Fix data inconsistent when punch hole
>   cifs/smb3: Fix data inconsistent when zero file range
>
>  fs/cifs/smb2ops.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> --
> 2.25.4
>


-- 
Thanks,

Steve

