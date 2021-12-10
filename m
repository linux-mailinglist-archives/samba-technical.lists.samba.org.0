Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39C470573
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 17:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k8L3DNuy+D05qVO+sF1MsrrGfcIbHU7Lr89yY2jDpU0=; b=BR7umeeKYhW850dRm0m/tIRDC1
	C12gioHEbrWBwiIqyWuMhfXQr8/4tUJHwwTa4xK6mPozbhO9voagfgfGThMFQoRlKvLZ8PPyAAgY5
	xM8X55V+OXnIzoqhDUAe2pYTgkfARNwM3lHJGtr0hRsx8GhVpXfBuBWTYApoKzM3eXeRn+pAGMNZr
	MSqSrWJhoVy3uW77Lr2Afn+dgg3Mh6xqXDlagLPjD3hGDna5VRypagSfWa6TTFXRDTAx2mcAVQnPL
	gJPG9026n+4eijqOHFllpy8lIwLGpLDr0xjXMmTC8f+QtXrdp00zg/BNxCKXvXdORrFZdz0OQAP30
	DGt/VadQ==;
Received: from ip6-localhost ([::1]:36252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvicO-0050iX-7U; Fri, 10 Dec 2021 16:19:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38701) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvicI-0050iO-UC
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 16:19:29 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x10so14204353edd.5
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 08:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2wqY9VmA/FI/Dsx1yquLL9Mx9J/2v/pB0JDR8ZF91Y=;
 b=A3+qMvDrI0l3+T7NkxOrOqF3A20q1cLnCzcWVAzrfJZbYdYLcQLtgUMbtLaUlE3T8b
 NdNhLzLoZT/AWut/7ZjcMK3aUGjsPl3kIznREKpqGpjeF0cZQE0MCe03/hAa0//zq7OE
 gbHF9pOhT9FBRm6no7feWol4nbkChSN5fTxCU+VB80AQmL2z5lkGdqCZbfk9He5qGFVa
 XkhidoV/UmKzbOadU8SOcP2FK2ICksUufI8YJuBZLdm7YagYCUtoistZJoDmf8dZYDQb
 L0caWIYVeRIBmR6mHPLEeETcuLUab3+vEcFhkD8K5zblOTDnSZd6cbb5VfwxP8Uw9vum
 aJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2wqY9VmA/FI/Dsx1yquLL9Mx9J/2v/pB0JDR8ZF91Y=;
 b=U4T7qcX6yvsXQQ6wTjQ5WNwbKd6WG4G/vptAnFmwken4Jqb1v80xa///Y+G0F3UU9I
 ySPZqh6lL/IeUfGYot3IUsZZ3vHpBF9RD90/AVTyJlPcREno8UFE40HGQNs9kuGIe80w
 /vz7BmMOdLmNrtBcTxyzBZ3AUNnqnB+/+8c755f/uIBEp8GU66H5l/mk6qvkKsR7cwyg
 Kzvry+oLliP0/dLQayu/5HaJXWb1vA9OjG8K4jLSMgu/O4dZb2gY9dXsTu8HVmz0CZ1a
 oUwpYBpxhpuoFltmnpl0FhNF7YZ8unOOmBGMLy4ps4pOGQN8LCJS5Tmh66rWEmowS5oc
 T4bw==
X-Gm-Message-State: AOAM531OevUdUOlONk6MNl96fAeyDJK7q7HpGH9WhkiydjpWErAGjsrB
 lnj0uEhjSBhVA7lqU6teIrSDA8q9eaW5SjCdt6JwmnGewlg/KA==
X-Google-Smtp-Source: ABdhPJwh+uWzPyp2ZmPuBU38t/yB4aNUJPnAKy4g8VAAT3AvEGhbkNNELSk6OkFTGFMMPaRg2OtR/9Zk6yQRTRSkaO4=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr25121839ejc.195.1639153160571; 
 Fri, 10 Dec 2021 08:19:20 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
In-Reply-To: <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
Date: Fri, 10 Dec 2021 11:19:09 -0500
Message-ID: <CAB5c7xqdxsPyuxNfOx-tCxCu3Jfm--CNQZXn=YCwUC3M72jSKQ@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For the pathologically curious, forgot to include link to MacOS SMB client
/ server source:
https://opensource.apple.com/source/smb/

IIRC it began its life as the BSD SMB1 client.

>
