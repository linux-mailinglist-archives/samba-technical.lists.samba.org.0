Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 219751A49CD
	for <lists+samba-technical@lfdr.de>; Fri, 10 Apr 2020 20:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/8e9T1aA34gtipux6MRR5JeX22u4u6r+1ck6KMnDmCE=; b=f93NLeVfA7J1ktEdIFg15s50JI
	cgs+zG8eqApVviQxJiLEQM3tvYEKVPywrHeiwx+uWapPG65RZzNtMLYoxOdDWw738a1mG9hHCBjp6
	9W+zX3eocBG5U65W25T90uFdBGhK24u6JrcXxc54pEXDvMKOpkZtRq3dhWBM4LSFI+Afvy3rbHiYE
	R0S20bMGoN7POFknxd3lo9FOgRL0AL/meDRxKxNFhR9zNJWHIM0Dal+uMkB9Y0iVi4rhQxhteAJf1
	M1huLEOI/y4iYjc1ZQytS3E+M/R5DvA+Z99/LceYuBx7XjubjCBidpsBRfucTndQz2sYWtI59EmH7
	i1uYekLA==;
Received: from localhost ([::1]:28826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMyLF-000Nlz-O5; Fri, 10 Apr 2020 18:25:25 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40195) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMyL3-000Nls-9s
 for samba-technical@lists.samba.org; Fri, 10 Apr 2020 18:25:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id 142so2778625ljj.7
 for <samba-technical@lists.samba.org>; Fri, 10 Apr 2020 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/8e9T1aA34gtipux6MRR5JeX22u4u6r+1ck6KMnDmCE=;
 b=kuBRYMu3ElDdUOqhfqRSlgM/BaOIhxXtbQtiKml+rK+iyzUZA43MpO84UTIkfHrVN9
 Dvn1KyBG5uOLPETwcDcKZnG+2R35EJiA+e4Zb/nzsqh2CmhAX76tnPzDqSMeu+A6dZ4V
 gSL/kwpLt846Hk2vlz1vx+4AEg2KUVvde7y6jMWzwR3/kWVuECqx4qB4pbD0nQ5BLy6J
 aTkFFVl7e6OlRAqzXKZjBP6gLuqP+gszOlydcDkyctpCR67a6J7vO2Y7ekvjS1s7QK3e
 zNUmogZmUf665osEUT1X6SU0WhGtPtcXMRK06NMRCAXGf639kIUGjiThmt9k4RV3LFj3
 UdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8e9T1aA34gtipux6MRR5JeX22u4u6r+1ck6KMnDmCE=;
 b=ubH2TAqVN/krFr4dRzBDuIeOUeSQyPoHiJKs8A02kHhWqCf4hvaf0RjtypNqancxCE
 eBsXj8LYd2pQQTT9JQobb7CGbpIQsL7IkQdKy4qsoZ7nwfW5bFiB7sYUKSSWzUL2NglJ
 zjVvpD0H5Q7z2BJKkuS7l7/TE+VzHCyFPRKyV0FgoEfuY8NPPPU8wW5pyfdwdhNbX2rC
 MsuOanlng9YDJgBbbV0PGY1AvUlzHnkOcJA6GhVMhn6yU9rcrEUEKGqAbMr6JGGaptuL
 5AkBA9UeCaWMqNXisO9M1mAv5OMPtzpXwWezeLbEfz+BikAlb243mowEIYCw31hcaY2m
 rSsA==
X-Gm-Message-State: AGi0PuZCc+q+C7xyuYPFYjNugp2AE2Qw5UGiclHI7lB3pUJN2XaMbNHZ
 MuYqDfPxTwiMDiLAkcdLyEo8b7F0vGI4MX7orA==
X-Google-Smtp-Source: APiQypJLhl8RsaXEReBMlt91OnPROxZF63+qBAZ8RukrkovkRVtTQ56I5ehkCEz6EsrUA0oYgsuMJr129K7uzU2Va6Q=
X-Received: by 2002:a2e:2286:: with SMTP id i128mr3641945lji.109.1586543112254; 
 Fri, 10 Apr 2020 11:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
In-Reply-To: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
Date: Fri, 10 Apr 2020 11:25:01 -0700
Message-ID: <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: Jones Syue <jonessyue@qnap.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D1=82, 10 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 09:50, Jones Syue =
via samba-technical
<samba-technical@lists.samba.org>:
>
> Hello list,
>
> please help review whether the attached patch is correct, thank you.
>
> Found a read performance issue when linux kernel page size is 64KB.
> If linux kernel page size is 64KB and mount options cache=3Dstrict &
> vers=3D2.1+,
> it does not support cifs_readpages(). Instead, it is using cifs_readpage(=
)
> and
> cifs_read() with maximum read IO size 16KB, which is much slower than rea=
d
> IO
> size 1MB when negotiated SMB 2.1+. Since modern SMB server supported SMB
> 2.1+
> and Max Read Size can reach more than 64KB (for example 1MB ~ 8MB), this
> patch
> do one more check on max_read to determine whether server support
> readpages()
> and improve read performance for page size 64KB & cache=3Dstrict & vers=
=3D2.1+.
>
> The client is a linux box with linux kernel 4.2.8,
> page size 64KB (CONFIG_ARM64_64K_PAGES=3Dy),
> cpu arm 1.7GHz, and use mount.cifs as smb client.
> The server is another linux box with linux kernel 4.2.8,
> share a file '10G.img' with size 10GB,
> and use samba-4.7.12 as smb server.
>
> The client mount a share from the server with different
> cache options: cache=3Dstrict and cache=3Dnone,
> mount -tcifs //<server_ip>/Public /cache_strict
> -overs=3D3.0,cache=3Dstrict,username=3D<xxx>,password=3D<yyy>
> mount -tcifs //<server_ip>/Public /cache_none
> -overs=3D3.0,cache=3Dnone,username=3D<xxx>,password=3D<yyy>
>
> The client download a 10GbE file from the server accross 1GbE network,
> dd if=3D/cache_strict/10G.img of=3D/dev/null bs=3D1M count=3D10240
> dd if=3D/cache_none/10G.img of=3D/dev/null bs=3D1M count=3D10240
>
> Found that cache=3Dstrict (without patch) is slower read throughput and
> smaller
> read IO size than cache=3Dnone.
> cache=3Dstrict (without patch): read throughput 40MB/s, read IO size is 1=
6KB
> cache=3Dstrict (with patch): read throughput 113MB/s, read IO size is 1MB
> cache=3Dnone: read throughput 109MB/s, read IO size is 1MB
>
> Looks like if page size is 64KB,
> cifs_set_ops() would use cifs_addr_ops_smallbuf instead of cifs_addr_ops,
>
> /* check if server can support readpages */
> if (cifs_sb_master_tcon(cifs_sb)->ses->server->maxBuf <
> PAGE_SIZE + MAX_CIFS_HDR_SIZE)
> inode->i_data.a_ops =3D &cifs_addr_ops_smallbuf;
> else
> inode->i_data.a_ops =3D &cifs_addr_ops;
>
> maxBuf is came from 2 places, SMB2_negotiate() and CIFSSMBNegotiate(),
> (SMB2_MAX_BUFFER_SIZE is 64KB)
> SMB2_negotiate():
> /* set it to the maximum buffer size value we can send with 1 credit */
> server->maxBuf =3D min_t(unsigned int, le32_to_cpu(rsp->MaxTransactSize),
>       SMB2_MAX_BUFFER_SIZE);
> CIFSSMBNegotiate():
> server->maxBuf =3D le32_to_cpu(pSMBr->MaxBufferSize);
>
> Page size 64KB and cache=3Dstrict lead to read_pages() use cifs_readpage(=
)
> instead
> of cifs_readpages(), and then cifs_read() using maximum read IO size 16KB=
,
> which is much slower than maximum read IO size 1MB.
> (CIFSMaxBufSize is 16KB by default)
>
> /* FIXME: set up handlers for larger reads and/or convert to async */
> rsize =3D min_t(unsigned int, cifs_sb->rsize, CIFSMaxBufSize);
>

Hi Jones,

Thanks for the patch!

It will work although it is probably a little bit cleaner to
initialize server->max_read to server->maxBuf for SMB1 and use the
server->max_read in the readpages condition check instead.

@Others, thoughts?

--
Best regards,
Pavel Shilovsky

