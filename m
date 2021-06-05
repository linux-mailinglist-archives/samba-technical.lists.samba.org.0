Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E977039CAFE
	for <lists+samba-technical@lfdr.de>; Sat,  5 Jun 2021 22:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4cStJ2sFpNIdNUI9DcsT/mkiPPlBZuyp5QLWw6imaYc=; b=RmK2FtLIkZJ9yh4Djg24JMU/1u
	RLRXuMDlKt/i0E847kXdtE3Xd3n9xRk2QlSm/W00dnOVUvxy7CFbaelPXFNdOcMletLO7sMv1QE2I
	UPneoExb9D3Ub5xKlHW5FrrSxZf4ML01V36xkIACHHgOoZ1cn8/GKXFT4Olv0iqTEUEyGu8ItpmBi
	xZ4QT/MeSm1UIh+4aKgqEx/ximcT/pkz71D52C70WgSp36k/xa98N423XMRSw+mym1U27uUCugQVp
	tB8JuUtkUCu/UEqMRWytCAR3wkwZBVfKgT/ubxOxv+VEVCLFBPT3G8hdjLuC/5cAPu9PonPrV51Xd
	gi1ei0vA==;
Received: from ip6-localhost ([::1]:23324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lpdCW-003lbk-DH; Sat, 05 Jun 2021 20:47:24 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:41515) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lpdCR-003lbb-Nw
 for samba-technical@lists.samba.org; Sat, 05 Jun 2021 20:47:21 +0000
Received: by mail-lj1-x229.google.com with SMTP id z22so372751ljh.8
 for <samba-technical@lists.samba.org>; Sat, 05 Jun 2021 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cStJ2sFpNIdNUI9DcsT/mkiPPlBZuyp5QLWw6imaYc=;
 b=QtESuXB0PtZjtH++S1RRH4E4aeMpqIog64vtVlivI9L5aWQy/NYlOY0JA49Iw+7ruB
 BKExjUaGCxe5wpVFe4rgQ6s40cHFz+q7wkvol2BmHb3EvlPjfIu87j/ew8qM4sFSHXSc
 yC10oxqRrzS8ZjSaNB30O90jVXqqgrRdON695OlQI517wLSAS2GcZ1dJF1ZBDlWMnlHR
 myxj5iUt44PiHPs1Vak4acZiER0POYz0P+v+h2iFXFhBJJOFo8VPUowU2ACZUdn+yF8I
 MY+OzIQ094gBxShy3RU0hIjXRrdAmR7xOuctFT1Uwkel6tZpZ/hZj/6SXEisjciQfltf
 BTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cStJ2sFpNIdNUI9DcsT/mkiPPlBZuyp5QLWw6imaYc=;
 b=rgA2V8/gq8miOtJy8XfuY8zJzBhXBJ2C49ioA5cjnD3ykoYDEnIEbu2Ia5btHMoLNe
 /uyY1MIdFT6MNM1ku5riuHZjIN1UXjYW77r0lv5WRD2yHbnxBUKarWmKwc/Gt7GPwKK5
 /ssmYxbIr7MPO0lgN/bQuW3za/YpSOZqGvfvzfebO87I2waNkxzaGIA382VxS+lN02MT
 8ozTJ9KWr3aFPPvGuu6i0F3peo/82j0az/nVr77zJchkWQkDYWofqeSzwIRu59EciMp4
 8rudWpiPwkoJ338j94tNzDIo8zFS1sjAXPSRp93LYylh/eW06roK8UnfCLU2GeVwGC/a
 0j7A==
X-Gm-Message-State: AOAM531Vmu4gesCnpyfcu7HRpg8Mf32+F2+702ISAIj/2oX4af0na2G2
 FLzRjNki4f9wyStyBb43VoTUbYeMH/VvEA4UUgI=
X-Google-Smtp-Source: ABdhPJx8RG63VVbd8Ot5eXuzN6ZGihtg29eGHWgc2Ip+SPl7/7Ys16S0wZ78B06DRVQgEfhazZNZsB91mSc4gmxKiIk=
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr3598873lji.477.1622926038656; 
 Sat, 05 Jun 2021 13:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210526203545.13160-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20210526203545.13160-1-rikard.falkeborn@gmail.com>
Date: Sat, 5 Jun 2021 15:47:07 -0500
Message-ID: <CAH2r5muYv=tMkkX2bV0W3OU7Z8GLPwiekh_6D0pPQp+ybhmuMQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Constify static struct genl_ops
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, May 26, 2021 at 4:06 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> The only usage of cifs_genl_ops[] is to assign its address to the ops
> field in the genl_family struct, which is a pointer to const. Make it
> const to allow the compiler to put it in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  fs/cifs/netlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/netlink.c b/fs/cifs/netlink.c
> index 5aaabe4cc0a7..291cb606f149 100644
> --- a/fs/cifs/netlink.c
> +++ b/fs/cifs/netlink.c
> @@ -30,7 +30,7 @@ static const struct nla_policy cifs_genl_policy[CIFS_GENL_ATTR_MAX + 1] = {
>         [CIFS_GENL_ATTR_SWN_RESOURCE_NAME]      = { .type = NLA_STRING},
>  };
>
> -static struct genl_ops cifs_genl_ops[] = {
> +static const struct genl_ops cifs_genl_ops[] = {
>         {
>                 .cmd = CIFS_GENL_CMD_SWN_NOTIFY,
>                 .validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
> --
> 2.31.1
>


-- 
Thanks,

Steve

