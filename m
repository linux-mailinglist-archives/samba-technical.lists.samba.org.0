Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0062C7A6
	for <lists+samba-technical@lfdr.de>; Wed, 16 Nov 2022 19:30:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=77XAxebAqAyYMRUyAGlAPFj2TGmxkp7bESfvwt/Tuuw=; b=omKSQ5IesIOmRRDsnIvnCvtRvS
	M5x+fkc9JxZzqveyXjmSpjha1Der0bCWSnRa4iNWKBgBbuYD3fNUGXErpuIKAU99d+irOP3gIAVKO
	H22oMNKUsWsMtipewfFge25jwRyhu1d7y73nOuVNM07hKY1gp0aLBNGbruImPeIbcCNq5MVQjPGOn
	Wh7CsoYZSuWq+oU5AaPhz6Vu2ewpVEsrSV417Sx/34hPz+LDzSd8/uMky7GuLdzPz3OwuU2r9gRqd
	BWNTVovbYHxvZMtRjoVjj9FqFLq49eLtgAZOM1f8GnzlMjrS7FD8vowfhoaV3dRx6Jia7M/EgFnaQ
	gm/3h1VQ==;
Received: from ip6-localhost ([::1]:30396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovNAd-00EZQr-0f; Wed, 16 Nov 2022 18:29:59 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:34623) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovNAX-00EZQi-NY
 for samba-technical@lists.samba.org; Wed, 16 Nov 2022 18:29:55 +0000
Received: by mail-lj1-x22d.google.com with SMTP id d3so22962173ljl.1
 for <samba-technical@lists.samba.org>; Wed, 16 Nov 2022 10:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=77XAxebAqAyYMRUyAGlAPFj2TGmxkp7bESfvwt/Tuuw=;
 b=Ja6dYWT5y6u1fweLisiUvKCbgo3mSLr0bX/aGUpQ7jZ0SfWUytQ2wrGSltAXq+pF95
 +tNLir/3Szkp/vj+K+v/gAlzhjjikWjn5YOgQc+p/SX7zFvMIQMhEZLW2yRMMW3BO0bt
 1UuNHTkRbha9S5zZ4Zieh4qC8JvSmOJKZoJyh6fYa01EXp9LagEL1HhnjFpafz8MP0bO
 mFGjglR1hKlh44IiaOlb4luJ6iHLd2+wy1vR74UyfE7ebbemTpb0EDZXG224uNlVwiwm
 iwsX43XtucD8RbhEeUhdZ2MOnaGlDEfdgRrv1MumVxNgq22ErI6BZEJVbhueBmIfw3Md
 DpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77XAxebAqAyYMRUyAGlAPFj2TGmxkp7bESfvwt/Tuuw=;
 b=i6jPHIKrt9WBCOuHYgvEnJgzBzX6w2HwbAxJ/bqKHkx3ATjbc7vNNqfSBVt9SbBl2L
 gZVwsD+m/1uivKPMYddp6NBnzyycGXdm88/NfOeUDa74ah8AmcRDeASysv+xUfH26EKU
 q61K3G6LE6VO/L35gJolBCg7TosriCfg8iaR8tea+U251XOF0VB5+0CYuBMSAIwze+V+
 IMlYjztcYjSFkOpHaPtkC9/v9C273b/MXwyjvDtzTckQJDq1LXNe+W4pIFmgnIPzh7c1
 7AHu0RE3TupBjgve7FTFhUnHci+UWkyRZvRKoMjy0hAF1uYJ27lApOrdRrd7yh9PKw0E
 YC0g==
X-Gm-Message-State: ANoB5plPXQtQuLqSK/Q9vdjtXxO9X2FVUIR20xFlaC9ss2WVisSpfIlQ
 kKaJaNJSkpsAMtUOwuVxULDHA7OpXdmuPNbQdZ4=
X-Google-Smtp-Source: AA0mqf75A6ArBLdkF4AmDh9po4MnZp8rDpfDM0un7FEUw3DM8zMVDcDpWZ8h3i6d0tBgWOYykunVZ5ke/DslnGiqdtU=
X-Received: by 2002:a2e:9853:0:b0:277:9e5:6cc4 with SMTP id
 e19-20020a2e9853000000b0027709e56cc4mr8817737ljj.137.1668623392463; Wed, 16
 Nov 2022 10:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20221116131835.2192188-1-hch@lst.de>
In-Reply-To: <20221116131835.2192188-1-hch@lst.de>
Date: Wed, 16 Nov 2022 12:29:41 -0600
Message-ID: <CAH2r5msoMJ6jNFDtHigKOqq9EwxEb9buxGVi8duW8EMz6wwgBg@mail.gmail.com>
Subject: Re: RFC: remove cifs_writepage
To: Christoph Hellwig <hch@lst.de>
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
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I can run some tests on this later this week.

On Wed, Nov 16, 2022 at 7:29 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Steve,
>
> this series tries to remove the ->writepage method from cifs, as there
> is no good reason for the method to exist anymore and we're trying to
> remove it entirely.
>
> The series is entirely untested as I don't have a CIFS setup at the
> moment, and patch 2 is a bit crude and there might be much better
> ways to handle the small wsize case.



-- 
Thanks,

Steve

