Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F76E2B26
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 22:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YR04VBU/zGMM/U6bSdpEHOLCFFS6w73fHXwqNZclHvs=; b=glLys502GpOZw7zoTwTvfZ7qQS
	Fei3y8QIKb3wDitMbyjvsWzD5ks5d8GwHC/URkw+0ukWb9D1nNeGLdos/lqUHGoIVFuIsPBFM0mzB
	OY8mYI1JKALQpIFYqRJI3afZVxtEJohyIJsAvsFJ7NFVw19iza6dd+FE6Nyz/KnXdF7OWpPDf0pF3
	K+4xJNNOPOP/NjNEl716bB7yRUVqrrQwCjELpNO8OXUYo9hINlhc6oJZtSyQ5CNinZwyDTuCvKLVe
	NMJZOntvpkGm8gERI4Klq3e5RD49rgCt+uwVO+ZFwmhPFBGbliygX8EupFVzCvAQoeWmM3awZrCu3
	X9X6Urlw==;
Received: from ip6-localhost ([::1]:30308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnQ7y-001yKB-O5; Fri, 14 Apr 2023 20:34:38 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:33775) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnQ7t-001yK2-Hq
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 20:34:36 +0000
Received: by mail-lj1-x233.google.com with SMTP id a29so20987047ljq.0
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681504472; x=1684096472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YR04VBU/zGMM/U6bSdpEHOLCFFS6w73fHXwqNZclHvs=;
 b=eTm7hV2w3IUWwinNoHMCeymEwIPM/H37vq70gfZ3UhMQyd6ysIFlRPC2RC4lNjtFdq
 tOFmGibaKP3Q1airQVWYq4sqhloQYnQL2tzgC7jVBBZ0crcgoXQh2egWjtWDgYheZE4q
 vR+BRJ8t//UB3mRMFpZodqtI06JJjdxLyXjrXT5vHswjXpAeOPO59zRc9ER93iwb0xDi
 dkCQ1XSnRKhxNV+3TFg75TCrrrZYqOqQohSnKiq0PaNhw9Dji8JifuSvPlFH1Qur8ZEn
 c2DfH6JyEX8IX6IstaSOYHrQEBeLdny+Vhp2enEZyblBuJ9ivFaJLLgJrGBUgbPQO7Tn
 tICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681504472; x=1684096472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YR04VBU/zGMM/U6bSdpEHOLCFFS6w73fHXwqNZclHvs=;
 b=e0fV1fzkigypNd0JCyD5hdBbTFMf3uJfyVD11YYLF8xNAAle/y2XEbgdOFhlByFBDj
 /yLxaZ1oZqIAHrczLyHmONQLkPSCuVtKGLo6F5EBB9rN3S/DMsD1xZxtK9EVRh7TbGDh
 Nz4zasxmeQukJDqe/XOPu1cfnKmoAKRUenD/IpQNql5av+T0SmDgJ0FmppAfkFMkvdK5
 LlxU34GTnyGHeaxGW/8LmthBVClyoW461rBGvcujdd2xlW0xnmrfobc6DhGb9KSEMFQk
 ogEeLKZwVqi+LNTOflnBqnyDeRsSu1D+Q4EE76kA1e/dnKW5tC69ZUpSReTZq9N8Egmj
 WMgg==
X-Gm-Message-State: AAQBX9fL8abWeBzDQXVz52Ra+rFcyDLbIebnYzwJyo2glcj6MLUkg35k
 u0ND+mCtemw77sxmId73aC9sPa9fN578adErRTTFMKqi4S0=
X-Google-Smtp-Source: AKy350btCesykn1J1wtde6c9JnkHy7Dv6HicI29PB0BOd1J1sn8OScoAKkQx5OIV0mI18POrdAQJWlpQhLhTvzUNoKU=
X-Received: by 2002:a2e:9d45:0:b0:29b:ebfa:765d with SMTP id
 y5-20020a2e9d45000000b0029bebfa765dmr2368917ljj.1.1681504471744; Fri, 14 Apr
 2023 13:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z59X6btqEMnRvdSze_5nOq0XVfg9odE_765Ci-5Of4exQ@mail.gmail.com>
 <20230413223852.4587e83b@echidna.fritz.box>
In-Reply-To: <20230413223852.4587e83b@echidna.fritz.box>
Date: Fri, 14 Apr 2023 17:34:19 -0300
Message-ID: <CAJq09z5-w7t-chg2rKPbOXYEJ=AF84RyU3YdEU0aqjpM-4=FMw@mail.gmail.com>
Subject: Re: DFS mounting wrong path
To: David Disseldorp <ddiss@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Luiz Angelo Daros de Luca via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>,
 Luiz Angelo Daros de Luca via samba-technical
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

I opened it at:

https://bugzilla.opensuse.org/show_bug.cgi?id=3D1210470

I also tried to create a simple setup with a smb server with hundreds
of shares mounted locally but it did not trigger the issue.
I added some wireshark messages (redacted) but I can share raw data in
private if needed.

It looks like the client did follow the right share the first time but
changed its mind before actually mounting it.

Regards,

---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com

Em qui., 13 de abr. de 2023 =C3=A0s 17:37, David Disseldorp
<ddiss@samba.org> escreveu:
>
> Hi Luiz,
>
> On Thu, 13 Apr 2023 16:41:20 -0300, Luiz Angelo Daros de Luca via samba-t=
echnical wrote:
>
> > Hello,
> >
> > I have a strange situation with the kernel following DFS directories
> > to the wrong location.
> > In a share with a couple of DFS entries, sometimes the kernel follows
> > the wrong path. Something like this:
> >
> > server: /share/dir/subdir1 -> msdfs:server\share1$
> > server: /share/dir/subdir2 -> msdfs:server\share2$
> > ...
> > server: /share/dir/subdir11 -> msdfs:server\share11$
> > server: /share/dir/subdir12 -> msdfs:server\share12$
> >
> > And in the client, we have:
> >
> > client: //server/dir/subdir1 on /mnt/share/dir/subdir1
> > client: //server/dir/subdir2 on /mnt/share/dir/subdir2
> > ...
> > client: //server/dir/subdir11 on /mnt/share/dir/subdir11
> > client: //server/dir/subdir12 on /mnt/share/dir/subdir11 <<< (should
> > be subdir12!)
> >
> > It always happens with older kernels (5.14 from opensuse/sles 15.4),
> > where the first DFS is always used everywhere. However it still
> > randomly happens with newer kernels like 6.2.9-1-default from opensuse
> > tumbleweed. I can always reproduce it if I do a "ls subdir*" but it
> > does not happen if I first "ls subdir12" and then "ls subdir*". It
> > looks like a race condition, but it might be an off-by-one case as I
> > only observed that with the last DFS in the directory (12th in my real
> > case).
> >
> > Has anyone seen this behavior?
>
> Yes, I've seen something like this, but didn't get a chance to look
> closer. Please raise a ticket on openSUSE / samba / kernel bugzilla
> tracker of your choice and add the reproducer details :)
>
> Cheers, David

