Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3039AB44A43
	for <lists+samba-technical@lfdr.de>; Fri,  5 Sep 2025 01:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9s60KoF32xU7Ch0qrDea3Gzz7b3wcn86xIVw6dE2Svk=; b=yODKaN6Lww+jXob5rsXFME/4U+
	fjUswSkGgMHaiuDa+2ZUs8HSM7vncsLWPDkzT0cp+sz8ZW0IDYu8N1MsVLJLIgkTLVhhQwcHDKkww
	qPAvxZk2IQrqcK6FJHcUqYRW7BMJ3pvJhvm3lm/9EgikrzwULkqaa8HigaHLn2u9c4oEwRx5FuNoH
	TD4PeacDgpqDurlNNzk5FV2L5ykFvlU6Gd3ByvJS9SugAqMHnuXlZWFgaBh747Bwz3OKpMYYNWzjZ
	x29C6d5n6cf3VBiA5ltlzdm0iCKkvIzp9Nnrlx3fcRGuFo+KixysA0X2Hj/2MbEba+qdk1KQcnPQi
	jBE9mi4w==;
Received: from ip6-localhost ([::1]:60282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uuJ9I-00354W-DD; Thu, 04 Sep 2025 23:13:48 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:59700) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuJ9D-00354P-58
 for samba-technical@lists.samba.org; Thu, 04 Sep 2025 23:13:47 +0000
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4b109c4af9eso14905321cf.3
 for <samba-technical@lists.samba.org>; Thu, 04 Sep 2025 16:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757027621; x=1757632421; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HYQ+uqCpx75vPe61F4Y/m7E3PW6qbz4/E3hKS1EKP2Q=;
 b=KboE9fzTneN9TSZZvJbw4JJkJG+TEKQrLbfCVqPkApg0/JCqnnD8ka1P0MmlQqrGxX
 tBCvQsWJXa4enpUIWwwnKAigAOhe64tf1vElDNFYtZ0qO+RA41OFgjcQYgHG/z0GKVDk
 Fwoo7GJqjcK/Mv7OuJTdegiKxtNcR9cGcVII7p+u2QUH71+lUNNU1HgfoAn5fBF+WY7Z
 lrUe2oZzhlSXcPBoe+PFmu6kO2akBEJOOcTnBBRChUU0tzRK15C7rKSQFE+7eHjaHcX3
 eBdOEoCG5JdH4hxU3l0+DbidaqEdMgZS6IXWIDUXOPmzAyJJTHVca2m3Mli6xZ4xhlTW
 axQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027621; x=1757632421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYQ+uqCpx75vPe61F4Y/m7E3PW6qbz4/E3hKS1EKP2Q=;
 b=jXfcRIuKr2CsUGvAehOkQCNdgHIrFYGDYt77MFGdGI8CuwSee8szEYXCm7mkIFRHMA
 3TSfhnj+4ZsRtuFxndAgujvh99JWWt/L8GGwGZBL+3Ss9BxDMsLRA/VB00Kqdy//Gd/s
 fErfAfR+VPyXtIo6ZQA8T41SHJbwkqclzPkMz3riqutJjsFhUx14UgVBokYTXU4Hoaa1
 BK6kubRMajc6gaT2f5aPTqOGDipoVdG7jcEXe1iLgZyLEYzfJHPlmKVQlZGBmI640oC7
 DBAnEUgi82pFqKH8IEdRCNESLghRMHVL+G3QK+wsYHJ5kDuOFdCyyNhsLJlNi6/eqQ9c
 hWbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoN09Ikw1cY7q8yC19liw4ZlRu2/T6FNCEbsL7E4hglOyJLvG5UnxVhgZoNc0W1tSWWZvyBFdYcEEvaxUKC1E=@lists.samba.org
X-Gm-Message-State: AOJu0Yz+gjVXOppYlYyVybUqEn1x+Va9ouSMQCe9FjsthJNxLul9L7FB
 XbZsLfIp0p2YXLSN6LEyUcBYwsWkOpVvkHza6M1iu11J/s7sah3FA0Xxr7Dk41gBk+CJdFeo3hR
 itaGnesX4SHNr4KzD9wxx9oZu3HKFx5s=
X-Gm-Gg: ASbGncsV4eDDNQOnY/+G+KJb1YKKH1xC22IbZMvsljQbKoQeIQybqMcbOduBVCdfAfj
 OaCRlgktGwYhp0Gfaf56JJJncpOkoeZe5qMYmW5xxYoiSa2b71Oe3G7EW1nWZ/P105k1WdNe3z8
 a+Tb8AlhEYoJz9lNw2bjhS8f3qgL2/nubOG9fM79Iuu87pARZIjdyDISR2TmnfjmbjC4EutVRdI
 9xtb9w3rB3CDhr/vMh3hlAt0YUT19hqK0dSTFi62VOhkvrZ63wVoETZ65QvSUDFnRQFZZbhrHY6
 KIzr+NI+pdUS1bN8te4dNXO/EIrdNAkNkAF5TQejAe0LB9UEzQFHllPhLLWWcYdbDRxkzNPr0U+
 z
X-Google-Smtp-Source: AGHT+IH/BhCubM7ZAJORTh+ZF5lhW5h8erCa0Mlsp98Vx5244BOo3v+E9VtYeJ+A0i1HKWN4a0EGFcDPKmW/xZOwG04=
X-Received: by 2002:a05:622a:4205:b0:4b4:24d3:c5ef with SMTP id
 d75a77b69052e-4b424d3ca05mr116682931cf.69.1757027620963; Thu, 04 Sep 2025
 16:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250904181059.1594876-1-metze@samba.org>
 <f88d11c2-f716-4f5d-ab37-fec73f2f5d97@samba.org>
In-Reply-To: <f88d11c2-f716-4f5d-ab37-fec73f2f5d97@samba.org>
Date: Thu, 4 Sep 2025 18:13:28 -0500
X-Gm-Features: Ac12FXzwJO8QiPDPr6PdPh-gfX3E7TsgxcwrQ1QzUkuItRY1BQxSecGil7KaQqw
Message-ID: <CAH2r5mtzFhRbpca6fZjRrpweqV+tHM6VcB7sghX0k43WpnErPg@mail.gmail.com>
Subject: Re: [PATCH] smb: server: let smb_direct_writev() respect
 SMB_DIRECT_MAX_SEND_SGES
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-rdma@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Tom Talpey <tom@talpey.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A git branch url that I can use to replace for-next -next sounds easiest

Thanks,

Steve

On Thu, Sep 4, 2025, 1:27=E2=80=AFPM Stefan Metzmacher <metze@samba.org> wr=
ote:

> Hi Steve,
>
> this is intended for 6.17 as it fixes a deadlock I was
> hitting when I run generic/011. I don't know why it only
> happened starting last Friday. I first thought it was a regression
> introduced by the patches I was working on on Friday, but
> after days of debugging using bpfstrace I noticed siw_post_send()
> was called twice with the same qp->sq_get/set values while still
> returning 0, as a result smb_direct_writev() was waiting forever
> for a completion and st->send_pending becoming 0.
>
>          wait_event(st->wait_send_pending,
>                     atomic_read(&st->send_pending) =3D=3D 0);
>
> This requires the patches in for-next-next to be rebased on top
> and this will generate some complicts I need to resolve.
> Should I post a v5 of the patches or should I provide a branch
> that can replace for-next-next?
>
> With this fix the siw.ko patch is optional for ksmbd a usecase,
> but it can be found here if someone is looking for it:
>
> https://lore.kernel.org/linux-rdma/20250904173608.1590444-1-metze@samba.o=
rg/
>
> Thanks!
> metze
>
> Am 04.09.25 um 20:10 schrieb Stefan Metzmacher:
> > We should not use more sges for ib_post_send() than we told the rdma
> > device in rdma_create_qp()!
> >
> > Otherwise ib_post_send() will return -EINVAL, so we disconnect the
> > connection. Or with the current siw.ko we'll get 0 from ib_post_send(),
> > but will never ever get a completion for the request. I've already sent=
 a
> > fix for siw.ko...
> >
> > So we need to make sure smb_direct_writev() limits the number of vector=
s
> > we pass to individual smb_direct_post_send_data() calls, so that we
> > don't go over the queue pair limits.
> >
> > Commit 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> > was very strange and I guess only needed because
> > SMB_DIRECT_MAX_SEND_SGES was 8 at that time. It basically removed the
> > check that the rdma device is able to handle the number of sges we try
> > to use.
> >
> > While the real problem was added by commit ddbdc861e37c ("ksmbd: smbd:
> > introduce read/write credits for RDMA read/write") as it used the
> > minumun of device->attrs.max_send_sge and device->attrs.max_sge_rd, wit=
h
> > the problem that device->attrs.max_sge_rd is always 1 for iWarp. And
> > that limitation should only apply to RDMA Read operations. For now we
> > keep that limitation for RDMA Write operations too, fixing that is a
> > task for another day as it's not really required a bug fix.
> >
> > Commit 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect
> > server SGEs") lowered SMB_DIRECT_MAX_SEND_SGES to 6, which is also used
> > by our client code. And that client code enforces
> > device->attrs.max_send_sge >=3D 6 since commit d2e81f92e5b7 ("Decrease =
the
> > number of SMB3 smbdirect client SGEs") and (briefly looking) only the
> > i40w driver provides only 3, see I40IW_MAX_WQ_FRAGMENT_COUNT. But
> > currently we'd require 4 anyway, so that would not work anyway, but now
> > it fails early.
> >
> > Cc: Namjae Jeon <linkinjeon@kernel.org>
> > Cc: Steve French <smfrench@gmail.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Hyunchul Lee <hyc.lee@gmail.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Cc: linux-rdma@vger.kernel.org
> > Fixes: 0626e6641f6b ("cifsd: add server handler for central processing
> and tranport layers")
> > Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDM=
A
> read/write")
> > Fixes: 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> > Fixes: 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect
> server SGEs")
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >   fs/smb/server/transport_rdma.c | 157 ++++++++++++++++++++++----------=
-
> >   1 file changed, 107 insertions(+), 50 deletions(-)
> >
> > diff --git a/fs/smb/server/transport_rdma.c
> b/fs/smb/server/transport_rdma.c
> > index 6cfca9a00060..3fb1b797a080 100644
> > --- a/fs/smb/server/transport_rdma.c
> > +++ b/fs/smb/server/transport_rdma.c
> > @@ -1219,78 +1219,130 @@ static int smb_direct_writev(struct
> ksmbd_transport *t,
> >                            bool need_invalidate, unsigned int remote_ke=
y)
> >   {
> >       struct smb_direct_transport *st =3D smb_trans_direct_transfort(t)=
;
> > -     int remaining_data_length;
> > -     int start, i, j;
> > -     int max_iov_size =3D st->max_send_size -
> > +     size_t remaining_data_length;
> > +     size_t iov_idx;
> > +     size_t iov_ofs;
> > +     size_t max_iov_size =3D st->max_send_size -
> >                       sizeof(struct smb_direct_data_transfer);
> >       int ret;
> > -     struct kvec vec;
> >       struct smb_direct_send_ctx send_ctx;
> > +     int error =3D 0;
> >
> >       if (st->status !=3D SMB_DIRECT_CS_CONNECTED)
> >               return -ENOTCONN;
> >
> >       //FIXME: skip RFC1002 header..
> > +     if (WARN_ON_ONCE(niovs <=3D 1 || iov[0].iov_len !=3D 4))
> > +             return -EINVAL;
> >       buflen -=3D 4;
> > +     iov_idx =3D 1;
> > +     iov_ofs =3D 0;
> >
> >       remaining_data_length =3D buflen;
> >       ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=3D%u\n", buflen);
> >
> >       smb_direct_send_ctx_init(st, &send_ctx, need_invalidate,
> remote_key);
> > -     start =3D i =3D 1;
> > -     buflen =3D 0;
> > -     while (true) {
> > -             buflen +=3D iov[i].iov_len;
> > -             if (buflen > max_iov_size) {
> > -                     if (i > start) {
> > -                             remaining_data_length -=3D
> > -                                     (buflen - iov[i].iov_len);
> > -                             ret =3D smb_direct_post_send_data(st,
> &send_ctx,
> > -
>  &iov[start], i - start,
> > -
>  remaining_data_length);
> > -                             if (ret)
> > +     while (remaining_data_length) {
> > +             struct kvec vecs[SMB_DIRECT_MAX_SEND_SGES - 1]; /* minus
> smbdirect hdr */
> > +             size_t possible_bytes =3D max_iov_size;
> > +             size_t possible_vecs;
> > +             size_t bytes =3D 0;
> > +             size_t nvecs =3D 0;
> > +
> > +             /*
> > +              * For the last message remaining_data_length should be
> > +              * have been 0 already!
> > +              */
> > +             if (WARN_ON_ONCE(iov_idx >=3D niovs)) {
> > +                     error =3D -EINVAL;
> > +                     goto done;
> > +             }
> > +
> > +             /*
> > +              * We have 2 factors which limit the arguments we pass
> > +              * to smb_direct_post_send_data():
> > +              *
> > +              * 1. The number of supported sges for the send,
> > +              *    while one is reserved for the smbdirect header.
> > +              *    And we currently need one SGE per page.
> > +              * 2. The number of negotiated payload bytes per send.
> > +              */
> > +             possible_vecs =3D min_t(size_t, ARRAY_SIZE(vecs), niovs -
> iov_idx);
> > +
> > +             while (iov_idx < niovs && possible_vecs && possible_bytes=
)
> {
> > +                     struct kvec *v =3D &vecs[nvecs];
> > +                     int page_count;
> > +
> > +                     v->iov_base =3D ((u8 *)iov[iov_idx].iov_base) +
> iov_ofs;
> > +                     v->iov_len =3D min_t(size_t,
> > +                                        iov[iov_idx].iov_len - iov_ofs=
,
> > +                                        possible_bytes);
> > +                     page_count =3D get_buf_page_count(v->iov_base,
> v->iov_len);
> > +                     if (page_count > possible_vecs) {
> > +                             /*
> > +                              * If the number of pages in the buffer
> > +                              * is to much (because we currently requi=
re
> > +                              * one SGE per page), we need to limit th=
e
> > +                              * length.
> > +                              *
> > +                              * We know possible_vecs is at least 1,
> > +                              * so we always keep the first page.
> > +                              *
> > +                              * We need to calculate the number extra
> > +                              * pages (epages) we can also keep.
> > +                              *
> > +                              * We calculate the number of bytes in th=
e
> > +                              * first page (fplen), this should never =
be
> > +                              * larger than v->iov_len because
> page_count is
> > +                              * at least 2, but adding a limitation
> feels
> > +                              * better.
> > +                              *
> > +                              * Then we calculate the number of bytes
> (elen)
> > +                              * we can keep for the extra pages.
> > +                              */
> > +                             size_t epages =3D possible_vecs - 1;
> > +                             size_t fpofs =3D offset_in_page(v->iov_ba=
se);
> > +                             size_t fplen =3D min_t(size_t, PAGE_SIZE =
-
> fpofs, v->iov_len);
> > +                             size_t elen =3D min_t(size_t, v->iov_len =
-
> fplen, epages*PAGE_SIZE);
> > +
> > +                             v->iov_len =3D fplen + elen;
> > +                             page_count =3D
> get_buf_page_count(v->iov_base, v->iov_len);
> > +                             if (WARN_ON_ONCE(page_count >
> possible_vecs)) {
> > +                                     /*
> > +                                      * Something went wrong in the
> above
> > +                                      * logic...
> > +                                      */
> > +                                     error =3D -EINVAL;
> >                                       goto done;
> > -                     } else {
> > -                             /* iov[start] is too big, break it */
> > -                             int nvec  =3D (buflen + max_iov_size - 1)=
 /
> > -                                             max_iov_size;
> > -
> > -                             for (j =3D 0; j < nvec; j++) {
> > -                                     vec.iov_base =3D
> > -                                             (char
> *)iov[start].iov_base +
> > -                                             j * max_iov_size;
> > -                                     vec.iov_len =3D
> > -                                             min_t(int, max_iov_size,
> > -                                                   buflen -
> max_iov_size * j);
> > -                                     remaining_data_length -=3D
> vec.iov_len;
> > -                                     ret =3D
> smb_direct_post_send_data(st, &send_ctx, &vec, 1,
> > -
>  remaining_data_length);
> > -                                     if (ret)
> > -                                             goto done;
> >                               }
> > -                             i++;
> > -                             if (i =3D=3D niovs)
> > -                                     break;
> >                       }
> > -                     start =3D i;
> > -                     buflen =3D 0;
> > -             } else {
> > -                     i++;
> > -                     if (i =3D=3D niovs) {
> > -                             /* send out all remaining vecs */
> > -                             remaining_data_length -=3D buflen;
> > -                             ret =3D smb_direct_post_send_data(st,
> &send_ctx,
> > -
>  &iov[start], i - start,
> > -
>  remaining_data_length);
> > -                             if (ret)
> > -                                     goto done;
> > -                             break;
> > +                     possible_vecs -=3D page_count;
> > +                     nvecs +=3D 1;
> > +                     possible_bytes -=3D v->iov_len;
> > +                     bytes +=3D v->iov_len;
> > +
> > +                     iov_ofs +=3D v->iov_len;
> > +                     if (iov_ofs >=3D iov[iov_idx].iov_len) {
> > +                             iov_idx +=3D 1;
> > +                             iov_ofs =3D 0;
> >                       }
> >               }
> > +
> > +             remaining_data_length -=3D bytes;
> > +
> > +             ret =3D smb_direct_post_send_data(st, &send_ctx,
> > +                                             vecs, nvecs,
> > +                                             remaining_data_length);
> > +             if (unlikely(ret)) {
> > +                     error =3D ret;
> > +                     goto done;
> > +             }
> >       }
> >
> >   done:
> >       ret =3D smb_direct_flush_send_list(st, &send_ctx, true);
> > +     if (unlikely(!ret && error))
> > +             ret =3D error;
> >
> >       /*
> >        * As an optimization, we don't wait for individual I/O to finish
> > @@ -1757,6 +1809,11 @@ static int smb_direct_init_params(struct
> smb_direct_transport *t,
> >               return -EINVAL;
> >       }
> >
> > +     if (device->attrs.max_send_sge < SMB_DIRECT_MAX_SEND_SGES) {
> > +             pr_err("warning: device max_send_sge =3D %d too small\n",
> > +                    device->attrs.max_send_sge);
> > +             return -EINVAL;
> > +     }
> >       if (device->attrs.max_recv_sge < SMB_DIRECT_MAX_RECV_SGES) {
> >               pr_err("warning: device max_recv_sge =3D %d too small\n",
> >                      device->attrs.max_recv_sge);
> > @@ -1780,7 +1837,7 @@ static int smb_direct_init_params(struct
> smb_direct_transport *t,
> >
> >       cap->max_send_wr =3D max_send_wrs;
> >       cap->max_recv_wr =3D t->recv_credit_max;
> > -     cap->max_send_sge =3D max_sge_per_wr;
> > +     cap->max_send_sge =3D SMB_DIRECT_MAX_SEND_SGES;
> >       cap->max_recv_sge =3D SMB_DIRECT_MAX_RECV_SGES;
> >       cap->max_inline_data =3D 0;
> >       cap->max_rdma_ctxs =3D t->max_rw_credits;
>
>
