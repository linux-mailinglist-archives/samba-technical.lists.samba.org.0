Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87CB1CB05
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tG4y0K7FYmkF3TagTYhqUQIG9HWksFFKdI76rAJxy/s=; b=UF7gIU8VLtZ7/7udbeDHaHfT8K
	Jp8U67rJTq3CgA93fAJxm/iiHeKBFMQ2QYhsa0sXTaiM4NiGlrfoj2k9goBZJMWVIZt/eD5G8n/3E
	XwcmE+jwU6XwrllIfuufcevGaRtn4D2OXJpA8ywx7nY7eFzUbF8MkOAHAlbgYDTvMM4FQqlOEP8Qi
	LHpJSwQ8RV544e9Xz27U/0z2SQRcTsT1uR0hLuhgBcuAETXHcRJBBkda3WTNkePzPWfJKl/oO9gts
	XwAnFdjFujuEfnKCWXU8YNOukJiUaPfJgradmdZFIVvZ+HtMPJf95FDPwv10k90QtAV839susWwbC
	UeJSL77g==;
Received: from ip6-localhost ([::1]:52640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji40-00ERNt-7V; Wed, 06 Aug 2025 17:36:32 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:57835) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3w-00ERNK-3e
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:36:30 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-70884da4b55so1939376d6.3
 for <samba-technical@lists.samba.org>; Wed, 06 Aug 2025 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754501786; x=1755106586; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tG4y0K7FYmkF3TagTYhqUQIG9HWksFFKdI76rAJxy/s=;
 b=WJlR2XNq3FQEZUQmVcvulAj3QVspVdwcrb/NLdZFwj3vGCm62ueZWefpaVVTDIbXSQ
 16dMh8pGewpKxjZzIWFcOmy79m2tnDKIG7mnD2aj6jYHXsnrVOo/ZgX49sGEKjHE9Ed6
 Am5eIKKf836nc2RNBnkiWL+acJi1owEgT07npScnBGXyvwYCVEGVO+Evbr8b2H7BlzlZ
 9VW4qRMvyJhgiK9mUh7GIE2Ntj95XqgOOXlF1P1su859YzqqY1NGkpUtkd57y7vgbBBd
 Ns3YDRB4yJ2BRqQ0YYN+QKNV89iiXOnKO+8jZSdYKEF49JL7cNCK7Xzl5z1hno6HiLFy
 VHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754501786; x=1755106586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tG4y0K7FYmkF3TagTYhqUQIG9HWksFFKdI76rAJxy/s=;
 b=c9BmFn93dDJs9bjX8sVMLQNqOGzP6KehE7boFI/tgFGzcjgHUjDUGncy3AWoJlQftd
 5oGVu09pPJalVyQ+asFG0eD+xStQoQZfZlD9TR5CGvp66pjlO0plvjxI35mj0BJVNQ48
 9GIDAK0QbYCp/ZRwXfsPd3RubRKSgj4kb+jj6N1AZLakMnMalylbotMAmey1G7BLLwoo
 j/NcWdOkuV4k8IuTMFe6tJaJzYGUXrutSXtIIB6/tA8DmTXmlh/1STLcAkzbgykLiBG5
 NhhxCMK6rowHVtBkpsRcBoY5YDALbOBFk8FoCjstHVrHCDIbml7vitBKcenhGFsbi+D5
 f+NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx0q95KvkBHdJVsE7ceDRseDQ3VPzNG/oTk36tw5ZQL5k9UJSPYhf+Zx0+Jycm+ujHzXen4FMotQomfFwCwW8=@lists.samba.org
X-Gm-Message-State: AOJu0Yy3TVBTdVm1YSvLOcGRTFe7N1pW39rrGRsjnrRKSFQr2x73naCg
 Qk4wKWqmTlRNV27OoETu8wtxpuSwMWLfRuVtvgF3o2z6RVpj3D6rEzgD4Fc/i+RmkljQVb2w2Dj
 gfB31kj11rOon9oROJwaG4T0uXdyFMDk=
X-Gm-Gg: ASbGncuwKq/TrsIfRe3Jx5/MGt6KN4FEseHv/aqolSvueDQy/G9LzBZ9GUf4OKalxa9
 5q3ukHZpED1HshqZccfcMf2Dzj91WbwZPT+V/sQVhUH3IjCL0Grrvo5QyHo1Pn4Y1cNHqE6peRb
 Qp+FGno4H/RzusJw+9+h1PVSV9R7V26BVFIUHUNcVxcPJhJlxBX7JIH7Nw5dxy7ScQnWghhmMaV
 IiZt2OI/Fr4Al64gXl7G+cjT8LXKuFtY7Egw9Hh
X-Google-Smtp-Source: AGHT+IGzDcfD2qHIG+mo+ege+DagqvA1//azNfvfnb2yuZhTKVYr/uEN5fZ1dpc/wNqlmJwHHc/bqD5u2cmGzM7JurA=
X-Received: by 2002:a05:6214:c48:b0:705:816:6179 with SMTP id
 6a1803df08f44-7097af9e47emr48063806d6.38.1754501785658; Wed, 06 Aug 2025
 10:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754308712.git.metze@samba.org>
 <0b80cf1a140280ca75ac21d5577a141e433d35f7.1754308712.git.metze@samba.org>
 <a9dc02a1-ab9c-4bc6-8a69-b0794bf258fd@samba.org>
In-Reply-To: <a9dc02a1-ab9c-4bc6-8a69-b0794bf258fd@samba.org>
Date: Wed, 6 Aug 2025 12:36:14 -0500
X-Gm-Features: Ac12FXz5nBcw2Aidgmewa8OmdQn9_4ZsgrKDmfpHKRql0Q-wm6uVMzLfTrGU90w
Message-ID: <CAH2r5mv_QySzx-PhdXmdYLo_u0ZD__8-sOafyk=UrvSYziiM9Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] smb: client: let send_done() cleanup before calling
 smbd_disconnect_rdma_connection()
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Done

On Wed, Aug 6, 2025 at 6:39=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi Steve,
>
> can you please squash this into the commit? Otherwise it introduces
> as new use-after-free problem with request->info.
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 7377216e033d..5d1fa83583f6 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc =
*wc)
>         if (wc->status !=3D IB_WC_SUCCESS || wc->opcode !=3D IB_WC_SEND) =
{
>                 log_rdma_send(ERR, "wc->status=3D%d wc->opcode=3D%d\n",
>                         wc->status, wc->opcode);
> -               mempool_free(request, request->info->request_mempool);
> -               smbd_disconnect_rdma_connection(request->info);
> +               mempool_free(request, info->request_mempool);
> +               smbd_disconnect_rdma_connection(info);
>                 return;
>         }
>
> Thanks!
> metze
>
> Am 04.08.25 um 14:10 schrieb Stefan Metzmacher:
> > We should call ib_dma_unmap_single() and mempool_free() before calling
> > smbd_disconnect_rdma_connection().
> >
> > And smbd_disconnect_rdma_connection() needs to be the last function to
> > call as all other state might already be gone after it returns.
> >
> > Cc: Steve French <smfrench@gmail.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Long Li <longli@microsoft.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >   fs/smb/client/smbdirect.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> > index 754e94a0e07f..b6c369088479 100644
> > --- a/fs/smb/client/smbdirect.c
> > +++ b/fs/smb/client/smbdirect.c
> > @@ -281,18 +281,20 @@ static void send_done(struct ib_cq *cq, struct ib=
_wc *wc)
> >       log_rdma_send(INFO, "smbd_request 0x%p completed wc->status=3D%d\=
n",
> >               request, wc->status);
> >
> > -     if (wc->status !=3D IB_WC_SUCCESS || wc->opcode !=3D IB_WC_SEND) =
{
> > -             log_rdma_send(ERR, "wc->status=3D%d wc->opcode=3D%d\n",
> > -                     wc->status, wc->opcode);
> > -             smbd_disconnect_rdma_connection(request->info);
> > -     }
> > -
> >       for (i =3D 0; i < request->num_sge; i++)
> >               ib_dma_unmap_single(sc->ib.dev,
> >                       request->sge[i].addr,
> >                       request->sge[i].length,
> >                       DMA_TO_DEVICE);
> >
> > +     if (wc->status !=3D IB_WC_SUCCESS || wc->opcode !=3D IB_WC_SEND) =
{
> > +             log_rdma_send(ERR, "wc->status=3D%d wc->opcode=3D%d\n",
> > +                     wc->status, wc->opcode);
> > +             mempool_free(request, request->info->request_mempool);
> > +             smbd_disconnect_rdma_connection(request->info);
> > +             return;
> > +     }
> > +
> >       if (atomic_dec_and_test(&request->info->send_pending))
> >               wake_up(&request->info->wait_send_pending);
> >
>


--=20
Thanks,

Steve

