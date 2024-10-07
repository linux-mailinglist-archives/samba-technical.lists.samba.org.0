Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB77992360
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2024 06:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nOgArWBJC8EePXX6ZD6ccL3/wpe9oAMr2gqSbvNQi/8=; b=EYQXCi5mnCVHEj3b6lUXGAr1ee
	85T0rk8lInvsxuQS7ffQbe0hrxkr+wQIx0JDk6a+2lfVVPCmGpk11NLmP1Ad86cYm3rT5nGOXuuqp
	9aYMnB47R2etbGNLv05kiFZrbKrJgfQ4pPt3Vj3KkIPI/zhD79/eQQu5P95b4zCN9NQAvG144MMC1
	g8tl9YS4XhmNHeXcEDfJLjjy+POET8zBeViujDeJ8bjIOxNIzHp9KwOHhjCAES5VgCcoyxEdcTcHo
	XZoUhfKm8+15yqkl9Smkg46ChVs4EMV2pYY+pETlQgsh9Xa9n+48ON+ai323F18DDDspz9VGQg7pm
	7b1Q85YA==;
Received: from ip6-localhost ([::1]:20554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sxf5i-003Bd3-3J; Mon, 07 Oct 2024 04:11:26 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:59454) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sxf5b-003Bcw-Vy
 for samba-technical@lists.samba.org; Mon, 07 Oct 2024 04:11:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fac787f39fso40553351fa.2
 for <samba-technical@lists.samba.org>; Sun, 06 Oct 2024 21:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728274278; x=1728879078; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOgArWBJC8EePXX6ZD6ccL3/wpe9oAMr2gqSbvNQi/8=;
 b=ftMjP0k6HUQW0y985AKDvjWdhUHYXgti9LvAgmOgkftydXkfCQAGpnqaggsCrxdnOb
 KPflmILD9RHrgbULD/9F+aGP7ItmQCBeqrEEJpzMvT5dg8/Ya7n7u7JOJUf/OMWJemr8
 poc+PfgcsDtYj3Usd84BOHmK7Z5dZoSWFOo7Wmw7mntw1qhGSrErbltwFcpqRR4ikU0Q
 5k7rXzVXsRV888G7vKiL1wz1haFE9FU8s5CmEPkhvtfJhtb+3YrRC4CMIAqsjTOMiL/X
 PxSdexYqILGWh4MG6ZZRe9yzPnPxkUWy3hh6+yevLag4hixUJ1j+n47SXu8WvTggN+bL
 qp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728274278; x=1728879078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOgArWBJC8EePXX6ZD6ccL3/wpe9oAMr2gqSbvNQi/8=;
 b=GRG9/K+xGWHgqZpb/AttVtHNtvvCWnpbZY48z1R2O0aTTm1/MTBBtShUkuH1rzBnUu
 4byiRZQz3qhOlYYrpNDbCqE/KOsbEiGEB8FFS1t5k1dYM9iosOnnqFfM2wnoNVwDVpem
 N0FxAACCX39dxvwQ5TK/li8G1Tl6XPu9b7cKeiaxak1Li3g5L963fK0zrvk78snc6iAq
 oClCJCdJE92UN7JBhaLxIeZjhtGr4ITm/1/8v8fhnTBaBOHKgZVucPWp2OzFBcpDEf9T
 gyEGcMnIc+FJsBf2GS6IhFKVxZLsbLBTBDQe9it6Ww0urFfajQlGSeJm8hPcVxFq8H3Y
 x4/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl5CfcF7UmuR7vyJFDyHgp5cnL6wY7JmW0H8gL+tQEGjRsIG25FRIcFT8cRd0LDSVTQmIC6HvmfDbdP+LqL9M=@lists.samba.org
X-Gm-Message-State: AOJu0YwtJseYe0BtQBrr5oPGvQyM+AkW/qmWKvUs4Lu3Y6MTrb0VvaLK
 aAQDkipIZUiB4ZAo7iMzgNF8seH4B5fwrHkYVEi7SQOY2o+qd6yDdctzn3hkQDsxv6Rldr7frip
 tgBpGae5IOysrKt2Q2HkEyjZPIMk=
X-Google-Smtp-Source: AGHT+IFZ5wRH6KQjFJkULO+H6xtDDe0Y4MoVBbNHr537uuoluDWd91eMT9lO+88/pRE7voBqHVE5Wp+6sajcy6L/R10=
X-Received: by 2002:a05:6512:104b:b0:535:3c94:70c2 with SMTP id
 2adb3069b0e04-539ab87710amr4641895e87.19.1728274277641; Sun, 06 Oct 2024
 21:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241007004855.150168-1-linux@treblig.org>
In-Reply-To: <20241007004855.150168-1-linux@treblig.org>
Date: Sun, 6 Oct 2024 23:11:06 -0500
Message-ID: <CAH2r5mvHnBnoS+hcyFiqNO8Z9rvzy6x=segDEvgP_hCyXfcAPg@mail.gmail.com>
Subject: Re: [PATCH] cifs: Remove unused functions
To: linux@treblig.org
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing and any
additional reviews

On Sun, Oct 6, 2024 at 7:49=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> cifs_ses_find_chan() has been unused since commit
> f486ef8e2003 ("cifs: use the chans_need_reconnect bitmap for reconnect st=
atus")
>
> cifs_read_page_from_socket() has been unused since commit
> d08089f649a0 ("cifs: Change the I/O paths to use an iterator rather than =
a page list")
>
> cifs_chan_in_reconnect() has been unused since commit
> bc962159e8e3 ("cifs: avoid race conditions with parallel reconnects")
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  fs/smb/client/cifsproto.h |  9 ---------
>  fs/smb/client/connect.c   | 12 ------------
>  fs/smb/client/sess.c      | 32 --------------------------------
>  3 files changed, 53 deletions(-)
>
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index 68c716e6261b..1d3470bca45e 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -252,10 +252,6 @@ extern int cifs_read_from_socket(struct TCP_Server_I=
nfo *server, char *buf,
>                                  unsigned int to_read);
>  extern ssize_t cifs_discard_from_socket(struct TCP_Server_Info *server,
>                                         size_t to_read);
> -extern int cifs_read_page_from_socket(struct TCP_Server_Info *server,
> -                                       struct page *page,
> -                                       unsigned int page_offset,
> -                                       unsigned int to_read);
>  int cifs_read_iter_from_socket(struct TCP_Server_Info *server,
>                                struct iov_iter *iter,
>                                unsigned int to_read);
> @@ -623,8 +619,6 @@ enum securityEnum cifs_select_sectype(struct TCP_Serv=
er_Info *,
>  int cifs_alloc_hash(const char *name, struct shash_desc **sdesc);
>  void cifs_free_hash(struct shash_desc **sdesc);
>
> -struct cifs_chan *
> -cifs_ses_find_chan(struct cifs_ses *ses, struct TCP_Server_Info *server)=
;
>  int cifs_try_adding_channels(struct cifs_ses *ses);
>  bool is_server_using_iface(struct TCP_Server_Info *server,
>                            struct cifs_server_iface *iface);
> @@ -640,9 +634,6 @@ cifs_chan_set_in_reconnect(struct cifs_ses *ses,
>  void
>  cifs_chan_clear_in_reconnect(struct cifs_ses *ses,
>                                struct TCP_Server_Info *server);
> -bool
> -cifs_chan_in_reconnect(struct cifs_ses *ses,
> -                         struct TCP_Server_Info *server);
>  void
>  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
>                              struct TCP_Server_Info *server);
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index adf8758847f6..15d94ac4095e 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -794,18 +794,6 @@ cifs_discard_from_socket(struct TCP_Server_Info *ser=
ver, size_t to_read)
>         return cifs_readv_from_socket(server, &smb_msg);
>  }
>
> -int
> -cifs_read_page_from_socket(struct TCP_Server_Info *server, struct page *=
page,
> -       unsigned int page_offset, unsigned int to_read)
> -{
> -       struct msghdr smb_msg =3D {};
> -       struct bio_vec bv;
> -
> -       bvec_set_page(&bv, page, to_read, page_offset);
> -       iov_iter_bvec(&smb_msg.msg_iter, ITER_DEST, &bv, 1, to_read);
> -       return cifs_readv_from_socket(server, &smb_msg);
> -}
> -
>  int
>  cifs_read_iter_from_socket(struct TCP_Server_Info *server, struct iov_it=
er *iter,
>                            unsigned int to_read)
> diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> index 3216f786908f..c88e9657f47a 100644
> --- a/fs/smb/client/sess.c
> +++ b/fs/smb/client/sess.c
> @@ -115,18 +115,6 @@ cifs_chan_clear_in_reconnect(struct cifs_ses *ses,
>         ses->chans[chan_index].in_reconnect =3D false;
>  }
>
> -bool
> -cifs_chan_in_reconnect(struct cifs_ses *ses,
> -                         struct TCP_Server_Info *server)
> -{
> -       unsigned int chan_index =3D cifs_ses_get_chan_index(ses, server);
> -
> -       if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX)
> -               return true;    /* err on the safer side */
> -
> -       return CIFS_CHAN_IN_RECONNECT(ses, chan_index);
> -}
> -
>  void
>  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
>                              struct TCP_Server_Info *server)
> @@ -487,26 +475,6 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct =
TCP_Server_Info *server)
>         spin_unlock(&ses->chan_lock);
>  }
>
> -/*
> - * If server is a channel of ses, return the corresponding enclosing
> - * cifs_chan otherwise return NULL.
> - */
> -struct cifs_chan *
> -cifs_ses_find_chan(struct cifs_ses *ses, struct TCP_Server_Info *server)
> -{
> -       int i;
> -
> -       spin_lock(&ses->chan_lock);
> -       for (i =3D 0; i < ses->chan_count; i++) {
> -               if (ses->chans[i].server =3D=3D server) {
> -                       spin_unlock(&ses->chan_lock);
> -                       return &ses->chans[i];
> -               }
> -       }
> -       spin_unlock(&ses->chan_lock);
> -       return NULL;
> -}
> -
>  static int
>  cifs_ses_add_channel(struct cifs_ses *ses,
>                      struct cifs_server_iface *iface)
> --
> 2.46.2
>
>


--=20
Thanks,

Steve

