Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627339CAFB
	for <lists+samba-technical@lfdr.de>; Sat,  5 Jun 2021 22:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yn/TbVn6f1UMlCFPmbCfjZI3NeczMRtP3SfRjDr4sck=; b=ush/6PYTzz/XImU1efP7SwCziz
	9mOo+PlPz5V98/HZFmD98rfupG8itB96aoRsa8efmqbIxtbF+k0BmOwrpIZ5ZU8XzqolBKBrE6jqB
	AaQZbLeAPOUgBje5/D/JrOKhs4NnyV1U0osLNiU+zWwvv9xcRjjisHVwPpZS2CTDgeN7+jHTeAloX
	tRhCe6sg+fGNVt7BxHcAEqWo+TleCHOrlH3bFn/DGt12BjRgs9ihotuFYTLiRLwbdrQdMjsYbypW0
	pbRXYlmeBsTe+fZ1ZfjJm3J6+w+f/SVDgAufw6Bz1hQPak6/ASRTV3F6KB3zfXIrzkmtF3/gabJSb
	20erp97A==;
Received: from ip6-localhost ([::1]:22640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lpd9m-003lIs-Ok; Sat, 05 Jun 2021 20:44:34 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:39781) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lpd9h-003lIj-Ng
 for samba-technical@lists.samba.org; Sat, 05 Jun 2021 20:44:31 +0000
Received: by mail-lj1-x231.google.com with SMTP id c11so16310787ljd.6
 for <samba-technical@lists.samba.org>; Sat, 05 Jun 2021 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yn/TbVn6f1UMlCFPmbCfjZI3NeczMRtP3SfRjDr4sck=;
 b=TiUc93tB+fvcHVCD3q43RWiQLi79CkumIXL99mU6fkQBIa1cTI5yEK6TuHvVb+YFds
 0rKD1gr8BCy2uVUVkopcbK6Nu3CXSaHt6RQCMY7B0+71h4D++r6ytoyIi6ZwQrY4hvo4
 SxtGq8KLRyyHfZJYZsXnkcSpO2NaBF1cy0DOlMN1WE/Z0BIqUVWHPPCJvMzttF2Z76qm
 S1sGi71wSChk4jh4cQ5N4TqIZ6+XfeW568hr9Yuf7THy72tpysgQN0TvD9boQDdL46pc
 mohZO6ZB/7MDHNXJODhbTPOZ3mYIi44DnJd/O1lAimCFxm/FtuStxE0X7I/UZeW1UXTI
 4OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yn/TbVn6f1UMlCFPmbCfjZI3NeczMRtP3SfRjDr4sck=;
 b=EPjZICLBFoX6N0Gn579DyouQacAYIfcAi46Cs+proLmManOfckhr2xJC7CRWFfasu7
 E2Anke10EG1nEluIb9EwGAHkQMIcrPlz9yRPYwyy/91k5iXMycpDNATnQVrCgGlZTL44
 P+yBsAMAwtcMecLsoRgJZG7i1sXD7PzKKIHTYvELz8G6cVwUNcMbtYi7KSAsn2nI0Isq
 eF5varOWV7B3lwJrjzuqkZUtL4iS0YzyYu/m+HhuRzkPw7D9FhMoyOiHZzcqWCUke/Hu
 3GfjEewCWpyDlqJahSD+E3C8QsvPP5UYiBg15rFQ2W4HOCAH6DYq9QznYcKyI0/kssgF
 O/Hg==
X-Gm-Message-State: AOAM531aJWU8gi5k0Y1p/NMj4lpUGodqgjFsDuci5+9I28Vl7ALvnQmN
 lzZ+zhZQJ2QyF0lqUafrlJAo9tKCL9nlA9OBxqo=
X-Google-Smtp-Source: ABdhPJwaogxOuxZI2Wd3F6lbz/Fxre7xfivwqwT2cRs6sNCy+XM0a/9IVdPmgNPcZArbbQqrIKnCuFSwVYhYNkQmZIc=
X-Received: by 2002:a2e:2e05:: with SMTP id u5mr8583721lju.256.1622925868100; 
 Sat, 05 Jun 2021 13:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210529114848.19608-1-yuehaibing@huawei.com>
 <87eednot8g.fsf@cjr.nz>
In-Reply-To: <87eednot8g.fsf@cjr.nz>
Date: Sat, 5 Jun 2021 15:44:17 -0500
Message-ID: <CAH2r5mtGz1vHrjh4nXg8E2NWsyq2V3BcO3XSnCWtLD1DZqurZQ@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Remove unused inline function
 is_sysvol_or_netlogon()
To: Paulo Alcantara <pc@cjr.nz>
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
 YueHaibing <yuehaibing@huawei.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, May 31, 2021 at 9:50 AM Paulo Alcantara <pc@cjr.nz> wrote:
>
> YueHaibing <yuehaibing@huawei.com> writes:
>
> > is_sysvol_or_netlogon() is never used, so can remove it.
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  fs/cifs/dfs_cache.c | 11 -----------
> >  1 file changed, 11 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>



-- 
Thanks,

Steve

