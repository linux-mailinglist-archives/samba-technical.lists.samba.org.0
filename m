Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DB62C79F
	for <lists+samba-technical@lfdr.de>; Wed, 16 Nov 2022 19:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SaUwZWGzJJ1Lp4N1+t6rbLaZmBRDQDLgc44MZWkfSlA=; b=YBpQQIozWFpXqe/ez4H4yW9E6z
	9Z4lhamwaD16E2sQr3Q4d+w2lF42Ms7Ju0/7DGXohStNc5vNiNeKQWSqgSYMqYHjNPg5ldyO/eRXI
	qyt3ezs08n2TNLJSW9MUYdPaIL9SUq90qix3lJMQY0wtt9NWTeRd0s34VLtMr6RncL5B3rAlI6LZ/
	MLZWV98zyWoPIu6L93ACM39KpRp4HCKkBYDNbAhiXe1AUhF/IYbnV3Ah9YgHIdrXYwS7vRMc6WAcJ
	+zg5jOAa3UuNX05vjAipDxWgCE9hjgmFPjMrNyrksXj/uojl+tc17DKXNSBPaEmvBSl3OSYlcaSoh
	7CjDld+Q==;
Received: from ip6-localhost ([::1]:36026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovN9Q-00EZ9P-M0; Wed, 16 Nov 2022 18:28:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovN9L-00EZ9G-Op
 for samba-technical@lists.samba.org; Wed, 16 Nov 2022 18:28:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id d6so30876851lfs.10
 for <samba-technical@lists.samba.org>; Wed, 16 Nov 2022 10:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SaUwZWGzJJ1Lp4N1+t6rbLaZmBRDQDLgc44MZWkfSlA=;
 b=PvwaWTcGbS+vSRmoDoFJEVax8j5icW23HNgH4TXBKd348S7cJZtyYQCgOIlypt1bJb
 +Amq0mHuuHfvyomxOCHoDZBF53tiairPCihc0spc8jdR8wjfGLu9+HBmjXo9UmVBCuYE
 VyNmUvxMFEDnoFZEsdD0BwypFrTJpQ2fWfPQah/wOPWdN1eP1Lmubf8KHJXetc1/p3nN
 uErQO+uWLr2LRlDzlzAFYP7fPCqSposoRjuglQvJ5mZqSLId2FpGVCgejoF1z6aqKsNP
 es6n1AHY7ZXO974JB3HqHyDk3cENtI3tDsB0nbugIX9HePrGaO8C3JQUXHr8TFOZ9nmA
 UvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SaUwZWGzJJ1Lp4N1+t6rbLaZmBRDQDLgc44MZWkfSlA=;
 b=md4qixqXxqrV6C/7xDAy+O0bC7SMAdfgeu9O72kxBdHrr2rwVuBYXj1io6eDFoqoU+
 zFICbXk0KHEF5qaFMczDvE8AG2o61XykrFYQab0VHIImOZNo1eg3DSOUfztn9RV3J7Q2
 WGvpIn/RxvTyNq2We6GGy9qtho+8QOsGYQYRyWcEFrI7I02+gZ2TDMfilh+g5HlFV6tq
 eRi92wENcFyA0miVTKM7y9CcHxY2csQVu8vd6M3H5ukhRe+XANQVj9AupndMJOwhqqf4
 lqI2d4NZkKovtjYRQfpk0FWwjGOf+9vctOSJXFI0fxPNKItF1T8z+CmCKWwLcUP5M9pc
 CQtw==
X-Gm-Message-State: ANoB5pk/GxKIQJKK7vTG7qzTsZ1LpDZq1KFOKhDGphD1gxs2he8+hjwV
 a+unmb44X04VvjOZEEX0e8D/LCN4ziSmAsN9gDc=
X-Google-Smtp-Source: AA0mqf4XAj8KhiMXEUh3kTVoZTHiB6PysvJJIUmhvFuRbnqAPxGcPIr/D7q1zdvmFUDba6t+gl/bVLhJ1Fc4aHjtEII=
X-Received: by 2002:a05:6512:3910:b0:4b0:a51e:2b3 with SMTP id
 a16-20020a056512391000b004b0a51e02b3mr8760830lfu.636.1668623318329; Wed, 16
 Nov 2022 10:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20221116141027.10947-1-abelova@astralinux.ru>
In-Reply-To: <20221116141027.10947-1-abelova@astralinux.ru>
Date: Wed, 16 Nov 2022 12:28:26 -0600
Message-ID: <CAH2r5murCb6icxS4YbguNbhKLsrrw9FR-p6vW-3njCtMDw3yrw@mail.gmail.com>
Subject: Re: [PATCH] cifs: add check for returning value of SMB2_set_info_init
To: Anastasia Belova <abelova@astralinux.ru>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, linux-cifs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Nov 16, 2022 at 8:26 AM Anastasia Belova <abelova@astralinux.ru> wrote:
>
> If the returning value of SMB2_set_info_init is an error-value,
> exit the function.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 0967e5457954 ("cifs: use a compound for setting an xattr")
>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/cifs/smb2ops.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 880cd494afea..c77e49b3fcc6 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -1116,6 +1116,8 @@ smb2_set_ea(const unsigned int xid, struct cifs_tcon *tcon,
>                                 COMPOUND_FID, current->tgid,
>                                 FILE_FULL_EA_INFORMATION,
>                                 SMB2_O_INFO_FILE, 0, data, size);
> +       if (rc)
> +               goto sea_exit;
>         smb2_set_next_command(tcon, &rqst[1]);
>         smb2_set_related(&rqst[1]);
>
> --
> 2.30.2
>


-- 
Thanks,

Steve

