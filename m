Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAECF19E1C6
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 02:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5TVVdjtml6JXABon4unEArMGra7kJXacNjWILU9VOgc=; b=Kda1M3W3Hnu3s0LvaoM1aMD4QS
	0rAcrkE1IRIvjknG1jDIVyHWMtsxYkB1zxuDBpyDk/Pof8HNi0lDDMBCvzWR5h5isuYobEW1WnDji
	sED/i8gupJFUUvBsbvdOmSbFSpbQ3xfV+XX94fPgWzjJZIOmLm8q6BAiHhZhr7WDsQ7+vqCFQAKte
	sH8QA6b4AXlgj00fqpbf1sxYsxGJCg7PHhh2LBHEoJ13xaswyqIvFYfYZ/oVnBjkisHCfp4l8btlX
	dD0N/InYNCz8lWINshvZpoJ6nEuythMVPdUwhhSkuBNpKPjD7UmRalPrOb3FipsG26ulvBLO720+G
	/szTcMxQ==;
Received: from localhost ([::1]:26492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKWJF-003Gms-CE; Sat, 04 Apr 2020 00:05:13 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKWJ5-003GmQ-GT
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 00:05:10 +0000
Received: by mail-lf1-x144.google.com with SMTP id c5so7246597lfp.5
 for <samba-technical@lists.samba.org>; Fri, 03 Apr 2020 17:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5TVVdjtml6JXABon4unEArMGra7kJXacNjWILU9VOgc=;
 b=eeBSdTHxVvlrlWwR1il4ox3+YNTYTuKEz8ChUXXdJ9QO01OJiER/Ilj4rjlf6kh5eR
 GWR9aTXnS19ZwzEmgOFXVnR7KeheI03r7KczGIJICQz/i2Te0tflqiXaSt14JCZTcO48
 lctScDzzdcoS/IK3eEDCH9KtZko/sKqARtNhj1xaSamVsIS4ouiRkBjB2+0G2p/BuGQK
 r1XkcoNQaCg2r/zVMhnYcwSaFrHM4+pra14Yo5vAwrIFDRcah+756mwaEA4OvyUXNIwA
 8rv4H92TpXLFIungGUqFOAjc67Pue6jp/HNgVuirxNLEUxAPesrSvFaFdRSpwqqDqq4M
 9NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5TVVdjtml6JXABon4unEArMGra7kJXacNjWILU9VOgc=;
 b=LJfiDEsXDhYc07FGWARHtn9vREC6amd97m6fb0wxfosYbk6sDX/4P/XPkqPGsA34Vq
 OlQS92+qL6g5a6vYVLUueErSK4+xyMS6pj07EYdGcrGsp31ng3gkh5762OtscR24PFRE
 ALvTKQKqMGfJgWfqCzcH7eZa+4GrvKkxHZWSJ8oN0Tl0km0ArO6Hao8bkmaswhTTai5a
 yP1zHd9Su59TXe2wPNms3+hcJ73N5Pk8TCrIPfQuFJRw6amjB7IP9jtUNUA4g1rjp/2+
 J1DelNu/lTR4vtnL+QI57gB/c7sKsNZtcMdBS1/JQfI46t35gzaf31ikwk+RsVA8eAdp
 z4zg==
X-Gm-Message-State: AGi0PuapgDzDe5+5tGdlLJCO8TmhfG7DNyaVTu5DiFlJamyZwcEp8cYL
 6kmQueAp1QI4Cm8w5I/wrdr6p/hDbEVJVoDN0Q==
X-Google-Smtp-Source: APiQypJZjzkMlOLYGeKDvfA8A+NrC/WyIP5a930kImq35w+pFFHBlpZDxqgaTcuW8L38FQYwLGnqFZUM2dLexYuIGG8=
X-Received: by 2002:a19:4843:: with SMTP id v64mr6664943lfa.171.1585958699614; 
 Fri, 03 Apr 2020 17:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <1585696903-96794-1-git-send-email-longli@linuxonhyperv.com>
 <CAKywueRg8kJ+0aOehM-QKGuRwbDSb2TA5vNje8eSCdMqBT+EdQ@mail.gmail.com>
 <BN8PR21MB11559BF18DF932A38624369ECEC70@BN8PR21MB1155.namprd21.prod.outlook.com>
In-Reply-To: <BN8PR21MB11559BF18DF932A38624369ECEC70@BN8PR21MB1155.namprd21.prod.outlook.com>
Date: Fri, 3 Apr 2020 17:04:48 -0700
Message-ID: <CAKywueRBghVuNtfP0XdLYL-wS_Nfci8uF_7pRPSjvQDif22BFQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Allocate crypto structures on the fly for
 calculating signatures of incoming packets
To: Long Li <longli@microsoft.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D1=82, 3 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 16:11, Long Li <lon=
gli@microsoft.com>:
>
> >Subject: Re: [PATCH] cifs: Allocate crypto structures on the fly for cal=
culating
> >signatures of incoming packets
> >
> >=D0=B2=D1=82, 31 =D0=BC=D0=B0=D1=80. 2020 =D0=B3. =D0=B2 16:22, <longli@=
linuxonhyperv.com>:
> >>
> >> From: Long Li <longli@microsoft.com>
> >>
> >> CIFS uses pre-allocated crypto structures to calculate signatures for
> >> both incoming and outgoing packets. In this way it doesn't need to
> >> allocate crypto structures for every packet, but it requires a lock to
> >> prevent concurrent access to crypto structures.
> >>
> >> Remove the lock by allocating crypto structures on the fly for
> >> incoming packets. At the same time, we can still use pre-allocated
> >> crypto structures for outgoing packets, as they are already protected
> >> by transport lock srv_mutex.
> >>
> >> Signed-off-by: Long Li <longli@microsoft.com>
> >> ---
> >>  fs/cifs/cifsglob.h      |  3 +-
> >>  fs/cifs/smb2proto.h     |  6 ++-
> >>  fs/cifs/smb2transport.c | 87
> >> +++++++++++++++++++++++++----------------
> >>  3 files changed, 60 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h index
> >> 0d956360e984..7448e7202e7a 100644
> >> --- a/fs/cifs/cifsglob.h
> >> +++ b/fs/cifs/cifsglob.h
> >> @@ -426,7 +426,8 @@ struct smb_version_operations {
> >>         /* generate new lease key */
> >>         void (*new_lease_key)(struct cifs_fid *);
> >>         int (*generate_signingkey)(struct cifs_ses *);
> >> -       int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Inf=
o *);
> >> +       int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Inf=
o *,
> >> +                               bool allocate_crypto);
> >>         int (*set_integrity)(const unsigned int, struct cifs_tcon *tco=
n,
> >>                              struct cifsFileInfo *src_file);
> >>         int (*enum_snapshots)(const unsigned int xid, struct cifs_tcon
> >> *tcon, diff --git a/fs/cifs/smb2proto.h b/fs/cifs/smb2proto.h index
> >> 4d1ff7b66fdc..087d5f14320b 100644
> >> --- a/fs/cifs/smb2proto.h
> >> +++ b/fs/cifs/smb2proto.h
> >> @@ -55,9 +55,11 @@ extern struct cifs_ses *smb2_find_smb_ses(struct
> >> TCP_Server_Info *server,  extern struct cifs_tcon
> >*smb2_find_smb_tcon(struct TCP_Server_Info *server,
> >>                                                 __u64 ses_id, __u32
> >> tid);  extern int smb2_calc_signature(struct smb_rqst *rqst,
> >> -                               struct TCP_Server_Info *server);
> >> +                               struct TCP_Server_Info *server,
> >> +                               bool allocate_crypto);
> >>  extern int smb3_calc_signature(struct smb_rqst *rqst,
> >> -                               struct TCP_Server_Info *server);
> >> +                               struct TCP_Server_Info *server,
> >> +                               bool allocate_crypto);
> >>  extern void smb2_echo_request(struct work_struct *work);  extern
> >> __le32 smb2_get_lease_state(struct cifsInodeInfo *cinode);  extern
> >> bool smb2_is_valid_oplock_break(char *buffer, diff --git
> >> a/fs/cifs/smb2transport.c b/fs/cifs/smb2transport.c index
> >> 08b703b7a15e..c01e19a3b112 100644
> >> --- a/fs/cifs/smb2transport.c
> >> +++ b/fs/cifs/smb2transport.c
> >> @@ -40,14 +40,6 @@
> >>  #include "smb2status.h"
> >>  #include "smb2glob.h"
> >>
> >> -static int
> >> -smb2_crypto_shash_allocate(struct TCP_Server_Info *server) -{
> >> -       return cifs_alloc_hash("hmac(sha256)",
> >> -                              &server->secmech.hmacsha256,
> >> -                              &server->secmech.sdeschmacsha256);
> >> -}
> >> -
> >>  static int
> >>  smb3_crypto_shash_allocate(struct TCP_Server_Info *server)  { @@
> >> -219,7 +211,8 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server,
> >> __u64 ses_id, __u32  tid)  }
> >>
> >>  int
> >> -smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info
> >> *server)
> >> +smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info
> >*server,
> >> +                       bool allocate_crypto)
> >>  {
> >>         int rc;
> >>         unsigned char smb2_signature[SMB2_HMACSHA256_SIZE];
> >> @@ -228,6 +221,8 @@ smb2_calc_signature(struct smb_rqst *rqst, struct
> >TCP_Server_Info *server)
> >>         struct smb2_sync_hdr *shdr =3D (struct smb2_sync_hdr *)iov[0].=
iov_base;
> >>         struct cifs_ses *ses;
> >>         struct shash_desc *shash;
> >> +       struct crypto_shash *hash;
> >> +       struct sdesc *sdesc =3D NULL;
> >>         struct smb_rqst drqst;
> >>
> >>         ses =3D smb2_find_smb_ses(server, shdr->SessionId); @@ -239,24
> >> +234,32 @@ smb2_calc_signature(struct smb_rqst *rqst, struct
> >TCP_Server_Info *server)
> >>         memset(smb2_signature, 0x0, SMB2_HMACSHA256_SIZE);
> >>         memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
> >>
> >> -       rc =3D smb2_crypto_shash_allocate(server);
> >> -       if (rc) {
> >> -               cifs_server_dbg(VFS, "%s: sha256 alloc failed\n", __fu=
nc__);
> >> -               return rc;
> >> +       if (allocate_crypto) {
> >> +               rc =3D cifs_alloc_hash("hmac(sha256)", &hash, &sdesc);
> >> +               if (rc) {
> >> +                       cifs_server_dbg(VFS,
> >> +                                       "%s: sha256 alloc failed\n", _=
_func__);
> >> +                       return rc;
> >> +               }
> >> +               shash =3D &sdesc->shash;
> >> +       } else {
> >> +               hash =3D server->secmech.hmacsha256;
> >> +               shash =3D &server->secmech.sdeschmacsha256->shash;
> >>         }
> >
> >smb2_crypto_shash_allocate() unconditionally allocated
> >server->secmech.hmacsha256 and server->secmech.sdeschmacsha256-
> >>shash.
>
> I think they are allocated in smb311_crypto_shash_allocate(), through
> =3D> smb311_crypto_shash_allocate
>  =3D> smb311_update_preauth_hash
>  =3D> compound_send_recv
>  =3D> cifs_send_recv
>  =3D> SMB2_negotiate
>
> The function names are a little misleading...

smb311_crypto_shash_allocate() only allocate those structures for SMB
3.1.1 protocol version, see the code below:

797 int
798 smb311_update_preauth_hash(struct cifs_ses *ses, struct kvec *iov, int =
nvec)
799 {
800 >-------int i, rc;
801 >-------struct sdesc *d;
802 >-------struct smb2_sync_hdr *hdr;
803
804 >-------if (ses->server->tcpStatus =3D=3D CifsGood) {
805 >------->-------/* skip non smb311 connections */
806 >------->-------if (ses->server->dialect !=3D SMB311_PROT_ID)
807 >------->------->-------return 0;

--
Best regards,
Pavel Shilovsky

