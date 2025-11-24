Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80BC80457
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 12:50:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qTsX74x3miO5NhXwBIi3PNOqqcYDVYQU/9M1KuaEhHU=; b=IV4/u6Q1H8c4yd+ODpruLs0Gwl
	b04ZojoupkdN0CaY8dFE3GzFN5sWJFLJBei22dgyWDJzeW8B+6ntyiqG3xg2kK/lvnlkdpKEm22fv
	nz7H2bnuW8fch0k5svtXrUvt+TMRprirNtG4idpAbsq9h5KstOk0tCcAQSiS1lYlxtCbFKICCrULm
	6jbxCIdZoFqwkPKiDJZyD9ExjCYIK2sx3DgT73WPglhxXtIwJ8KJZw7kch32zEQJw3nIrYgICaun5
	8xEdVfCRf+eWU3F1Tt+WMLMcKGtZTI3t2cOxgtrQoE9YBnwsdCLMPf4GKW4rRUtwYCqELD9OJOMqh
	BGuBL78Q==;
Received: from ip6-localhost ([::1]:52984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNV5G-00D0SF-Ff; Mon, 24 Nov 2025 11:50:18 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:48537) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNV5A-00D0S5-HE
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 11:50:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so752723866b.1
 for <samba-technical@lists.samba.org>; Mon, 24 Nov 2025 03:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763985012; x=1764589812; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTsX74x3miO5NhXwBIi3PNOqqcYDVYQU/9M1KuaEhHU=;
 b=At47mtgrJ54xgxkOtaa97SC/79dc8LckNudy8TqRwOLC4lvT5v0kiNcl31CH33ohIc
 etK9N9MBPeF+GWfrqvn+nAHgL5wFdO08IFnvKza6L6t1gpbPXouB57lpVvO3n743SeE2
 nSsSlTBPz5Xsapj3YvI6Bwu5rwHKx7oBQ5NO/GH5RRdy74TG7AG8rpKCk/reSP2afEU4
 KUdlbYW3PcET94kM9EoAh4u6IXUOwDTeZo+zW/olAVMswBfoD/o1XUBoBTMcb7yvDSOO
 qVPH9rQrC+/VlRNSixJQRaSXFyeoSUPUd368V/hcQNLUQ+bRj1O6wz1mAJyK3j/lxlrP
 hYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763985012; x=1764589812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qTsX74x3miO5NhXwBIi3PNOqqcYDVYQU/9M1KuaEhHU=;
 b=pK8qg5HX5sn3n7J/daGuCPrRSl3WfAUC1kiAf89WiCBzbXtJlLG0cGbMyeXq7MV70A
 C+8Sd+EumyTSUXaJBrM4zugvVyzw0+FyJqGSjxoVz4II65GVVlANAu7GmhXbsp/Ny4SF
 VvUTFvXH0tSuqyrMd+ZrtyqrvUPdxgEEYfFurYzNGsZJvjr46MAtFjGQiYJMOnmAO/zG
 EpmNjNUapB5YDQd9nE6kEmJ1lJV/7pDTm2MNBJUpF5BRwM7qztAiAYPP62ORPnkwSPw5
 TfXjBqCne4m4UTODHcqQULV3FzTTdzFiykd3MmUrl6VMPEn1+eXVw0LJG2H+gWxja1Op
 uxVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfUaJ4kwLF5A1CKuZUQzgz1LpdSeuub54i0+hN1iLM+p4UnfS6RIhhX8lNiWKjuzWx7KvOhQNtaAdvDvuhiE=@lists.samba.org
X-Gm-Message-State: AOJu0YxIHXB0765xAmUNBJb1Bfp+NcBwet0cDl1NzVWPJYd3HvzLnZo6
 1lhKuaEHre17R9K9yVGXAWqgC3dTdHc9b5zHumpoOnFbdE3qf+fe+3A7V+VS4YUvF/5nWkWA/2J
 B/lACS1nKw+UjLzivCpK27B7qmLMLxXE=
X-Gm-Gg: ASbGnctS3wvGEiPRcsRK/BW1lVygE55vaRIK1D7rilh1pabaS63MO6KGxOQ7Vi1PA99
 5lFt0XBklNpQ2O9n0Jqf8sC0KPankoyhXSen94Uwd9ZbwFV9bsom6dzf16gmHKRBQkumcatNFMl
 kLNctOIkPkPJw0YsmVfXTf44WjUHjhC3NnFuXRMcRoYzBHU7za+F8QtkqKls0fKmg1/Ey85MuRi
 jVO12o03X6f51OpOZEQmEVVoz5rz5yVG7XpfB1JL35s251jA8vhox63PmcwS+bEhvLkMA==
X-Google-Smtp-Source: AGHT+IFZ4hgOnP+GGzFtxXgwCCUo5PfAR/nWqfGsAUnrg85wi9EqQVdLNnZC+kYcsuEtY2QjopW1tLau3Ug6FTb/Vnw=
X-Received: by 2002:a17:907:7244:b0:b76:63b8:7394 with SMTP id
 a640c23a62f3a-b767184bc2bmr1299210766b.51.1763985011282; Mon, 24 Nov 2025
 03:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20251118022655.126994-1-rajasimandalos@gmail.com>
 <CAFTVevWRXF8TCDQstp7r1uu8eZ21M4m1EPs3zXANPTDj8bh_ZQ@mail.gmail.com>
In-Reply-To: <CAFTVevWRXF8TCDQstp7r1uu8eZ21M4m1EPs3zXANPTDj8bh_ZQ@mail.gmail.com>
Date: Mon, 24 Nov 2025 17:19:58 +0530
X-Gm-Features: AWmQ_bnIjQgahXtJjHFnWg5u-M5ugvbyueAQzBGUsEwA0mwLa5NlWynD5jzcwWc
Message-ID: <CANT5p=ohMvQ+0+YYCQrkSw7sPW24gs60TQzBoiAyfedO8GXgfQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: client: allow changing multichannel mount options
 on remount
To: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Rajasi Mandal <rajasimandal@microsoft.com>, linux-cifs@vger.kernel.org,
 sprasad@microsoft.com, pc@manguebit.org,
 Rajasi Mandal <rajasimandalos@gmail.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 tom@talpey.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 20, 2025 at 11:40=E2=80=AFAM Meetakshi Setiya
<meetakshisetiyaoss@gmail.com> wrote:
>
> Hi Rajasi,
>
> On Tue, Nov 18, 2025 at 7:59=E2=80=AFAM Rajasi Mandal <rajasimandalos@gma=
il.com> wrote:
> >
> > From: Rajasi Mandal <rajasimandal@microsoft.com>
> >
> > Previously, the client did not update a session's channel state when
> > multichannel or max_channels mount options were changed via remount.
> > This led to inconsistent behavior and prevented enabling or disabling
> > multichannel support without a full unmount/remount cycle.
> >
> > Enable dynamic reconfiguration of multichannel and max_channels during
> > remount by:
> > - Introducing smb3_sync_ses_chan_max(), a centralized function for
> >   channel updates which synchronizes the session's channels with the
> >   updated configuration.
> > - Replacing cifs_disable_secondary_channels() with
> >   cifs_decrease_secondary_channels(), which accepts a from_reconfigure
> >   flag to support targeted cleanup during reconfiguration.
> > - Updating remount logic to detect changes in multichannel or
> >   max_channels and trigger appropriate session/channel updates.
> >
> > Current limitation:
> > - The query_interfaces worker runs even when max_channels=3D1 so that
> >   multichannel can be enabled later via remount without requiring an
> >   unmount. This is a temporary approach and may be refined in the
> >   future.
> >
> > Users can safely modify multichannel and max_channels on an existing
> > mount. The client will correctly adjust the session's channel state to
> > match the new configuration, preserving durability where possible and
> > avoiding unnecessary disconnects.
> >
> > Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
> > Signed-off-by: Rajasi Mandal <rajasimandal@microsoft.com>
> > ---
> >  fs/smb/client/cifsproto.h  |  4 ++-
> >  fs/smb/client/connect.c    |  4 ++-
> >  fs/smb/client/fs_context.c | 50 +++++++++++++++++++++++++++++++++-
> >  fs/smb/client/sess.c       | 32 +++++++++++++++-------
> >  fs/smb/client/smb2pdu.c    | 55 ++++++++++++++++++++++++++++----------
> >  5 files changed, 119 insertions(+), 26 deletions(-)
> >
> > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > index 3528c365a452..a1fc9e1918bc 100644
> > --- a/fs/smb/client/cifsproto.h
> > +++ b/fs/smb/client/cifsproto.h
> > @@ -649,6 +649,8 @@ int cifs_alloc_hash(const char *name, struct shash_=
desc **sdesc);
> >  void cifs_free_hash(struct shash_desc **sdesc);
> >
> >  int cifs_try_adding_channels(struct cifs_ses *ses);
> > +int smb3_update_ses_channels(struct cifs_ses *ses, struct TCP_Server_I=
nfo *server,
> > +                                       bool from_reconnect, bool from_=
reconfigure);
> >  bool is_ses_using_iface(struct cifs_ses *ses, struct cifs_server_iface=
 *iface);
> >  void cifs_ses_mark_for_reconnect(struct cifs_ses *ses);
> >
> > @@ -674,7 +676,7 @@ bool
> >  cifs_chan_is_iface_active(struct cifs_ses *ses,
> >                           struct TCP_Server_Info *server);
> >  void
> > -cifs_disable_secondary_channels(struct cifs_ses *ses);
> > +cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_recon=
figure);
> >  void
> >  cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *s=
erver);
> >  int
> > diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> > index 55cb4b0cbd48..cebe4a5f54f2 100644
> > --- a/fs/smb/client/connect.c
> > +++ b/fs/smb/client/connect.c
> > @@ -3927,7 +3927,9 @@ int cifs_mount(struct cifs_sb_info *cifs_sb, stru=
ct smb3_fs_context *ctx)
> >         ctx->prepath =3D NULL;
> >
> >  out:
> > -       cifs_try_adding_channels(mnt_ctx.ses);
> > +       smb3_update_ses_channels(mnt_ctx.ses, mnt_ctx.server,
> > +                                 false /* from_reconnect */,
> > +                                 false /* from_reconfigure */);
>
> Shouldn't this be added to the non-dfs cifs_mount() too? I see that
> even cifs_try_adding_channels() is not present in this function,
> @Shyam Prasad is this expected?

That's a good catch.
I think this is a day-0 bug.
I can see that the original change by Aurelien has the change only in
DFS cifs_mount:
commit d70e9fa55884760b6d6c293dbf20d8c52ce11fb7
Author: Aurelien Aptel <aaptel@suse.com>
Date:   Fri Sep 20 06:31:10 2019 +0200

    cifs: try opening channels after mounting

We should have a follow-up patch to fix this.

>
> >         rc =3D mount_setup_tlink(cifs_sb, mnt_ctx.ses, mnt_ctx.tcon);
> >         if (rc)
> >                 goto error;
> > diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> > index 0f894d09157b..751ed6ebd458 100644
> > --- a/fs/smb/client/fs_context.c
> > +++ b/fs/smb/client/fs_context.c
> > @@ -717,6 +717,7 @@ static int smb3_fs_context_parse_param(struct fs_co=
ntext *fc,
> >  static int smb3_fs_context_parse_monolithic(struct fs_context *fc,
> >                                             void *data);
> >  static int smb3_get_tree(struct fs_context *fc);
> > +static void smb3_sync_ses_chan_max(struct cifs_ses *ses, unsigned int =
max_channels);
> >  static int smb3_reconfigure(struct fs_context *fc);
> >
> >  static const struct fs_context_operations smb3_fs_context_ops =3D {
> > @@ -1013,6 +1014,22 @@ int smb3_sync_session_ctx_passwords(struct cifs_=
sb_info *cifs_sb, struct cifs_se
> >         return 0;
> >  }
> >
> > +/*
> > + * smb3_sync_ses_chan_max - Synchronize the session's maximum channel =
count
> > + * @ses: pointer to the old CIFS session structure
> > + * @max_channels: new maximum number of channels to allow
> > + *
> > + * Updates the session's chan_max field to the new value, protecting t=
he update
> > + * with the session's channel lock. This should be called whenever the=
 maximum
> > + * allowed channels for a session changes (e.g., after a remount or re=
configure).
> > + */
> > +static void smb3_sync_ses_chan_max(struct cifs_ses *ses, unsigned int =
max_channels)
> > +{
> > +       spin_lock(&ses->chan_lock);
> > +       ses->chan_max =3D max_channels;
> > +       spin_unlock(&ses->chan_lock);
> > +}
> > +
> >  static int smb3_reconfigure(struct fs_context *fc)
> >  {
> >         struct smb3_fs_context *ctx =3D smb3_fc2context(fc);
> > @@ -1095,7 +1112,38 @@ static int smb3_reconfigure(struct fs_context *f=
c)
> >                 ses->password2 =3D new_password2;
> >         }
> >
> > -       mutex_unlock(&ses->session_mutex);
> > +       /*
> > +        * If multichannel or max_channels has changed, update the sess=
ion's channels accordingly.
> > +        * This may add or remove channels to match the new configurati=
on.
> > +        */
> > +       if ((ctx->multichannel !=3D cifs_sb->ctx->multichannel) ||
> > +           (ctx->max_channels !=3D cifs_sb->ctx->max_channels)) {
> > +
> > +               /* Synchronize ses->chan_max with the new mount context=
 */
> > +               smb3_sync_ses_chan_max(ses, ctx->max_channels);
> > +               /* Now update the session's channels to match the new c=
onfiguration */
> > +               /* Prevent concurrent scaling operations */
> > +               spin_lock(&ses->ses_lock);
> > +               if (ses->flags & CIFS_SES_FLAG_SCALE_CHANNELS) {
> > +                       spin_unlock(&ses->ses_lock);
> > +                       return -EINVAL;
> > +               }
> > +               ses->flags |=3D CIFS_SES_FLAG_SCALE_CHANNELS;
> > +               spin_unlock(&ses->ses_lock);
> > +
> > +               mutex_unlock(&ses->session_mutex);
> > +
> > +               rc =3D smb3_update_ses_channels(ses, ses->server,
> > +                                              false /* from_reconnect =
*/,
> > +                                              true /* from_reconfigure=
 */);
> > +
> > +               /* Clear scaling flag after operation */
> > +               spin_lock(&ses->ses_lock);
> > +               ses->flags &=3D ~CIFS_SES_FLAG_SCALE_CHANNELS;
> > +               spin_unlock(&ses->ses_lock);
> > +       } else {
> > +               mutex_unlock(&ses->session_mutex);
> > +       }
> >
> >         STEAL_STRING(cifs_sb, ctx, domainname);
> >         STEAL_STRING(cifs_sb, ctx, nodename);
> > diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> > index ef3b498b0a02..cfd83986a84a 100644
> > --- a/fs/smb/client/sess.c
> > +++ b/fs/smb/client/sess.c
> > @@ -265,12 +265,16 @@ int cifs_try_adding_channels(struct cifs_ses *ses=
)
> >  }
> >
> >  /*
> > - * called when multichannel is disabled by the server.
> > - * this always gets called from smb2_reconnect
> > - * and cannot get called in parallel threads.
> > + * cifs_decrease_secondary_channels - Reduce the number of active seco=
ndary channels
> > + * @ses: pointer to the CIFS session structure
> > + * @from_reconfigure: if true, only reduce to chan_max; if false, redu=
ce to a single channel
> > + *
> > + * This function disables and cleans up extra secondary channels for a=
 CIFS session.
> > + * If called during reconfiguration, it reduces the channel count to t=
he new maximum (chan_max).
> > + * Otherwise, it disables all but the primary channel.
> >   */
> >  void
> > -cifs_disable_secondary_channels(struct cifs_ses *ses)
> > +cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_recon=
figure)
> >  {
> >         int i, chan_count;
> >         struct TCP_Server_Info *server;
> > @@ -281,12 +285,13 @@ cifs_disable_secondary_channels(struct cifs_ses *=
ses)
> >         if (chan_count =3D=3D 1)
> >                 goto done;
> >
> > -       ses->chan_count =3D 1;
> > -
> > -       /* for all secondary channels reset the need reconnect bit */
> > -       ses->chans_need_reconnect &=3D 1;
> > +       /* Update the chan_count to the new maximum */
> > +       if (from_reconfigure)
> > +               ses->chan_count =3D ses->chan_max;
> > +       else
> > +               ses->chan_count =3D 1;
> >
> > -       for (i =3D 1; i < chan_count; i++) {
> > +       for (i =3D ses->chan_max ; i < chan_count; i++) {
> >                 iface =3D ses->chans[i].iface;
> >                 server =3D ses->chans[i].server;
> >
> > @@ -318,6 +323,15 @@ cifs_disable_secondary_channels(struct cifs_ses *s=
es)
> >                 spin_lock(&ses->chan_lock);
> >         }
> >
> > +       /* For extra secondary channels, reset the need reconnect bit *=
/
> > +       if (ses->chan_count =3D=3D 1) {
> > +               cifs_dbg(VFS, "server does not support multichannel any=
more. Disable all other channels\n");
> > +               ses->chans_need_reconnect &=3D 1;
> > +       } else {
> > +               cifs_dbg(VFS, "Disable extra secondary channels\n");
> > +               ses->chans_need_reconnect &=3D ((1UL << ses->chan_max) =
- 1);
> > +       }
> > +
> >  done:
> >         spin_unlock(&ses->chan_lock);
> >  }
> > diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> > index 8b4a4573e9c3..d051da46eaab 100644
> > --- a/fs/smb/client/smb2pdu.c
> > +++ b/fs/smb/client/smb2pdu.c
> > @@ -168,7 +168,7 @@ smb2_hdr_assemble(struct smb2_hdr *shdr, __le16 smb=
2_cmd,
> >  static int
> >  cifs_chan_skip_or_disable(struct cifs_ses *ses,
> >                           struct TCP_Server_Info *server,
> > -                         bool from_reconnect)
> > +                         bool from_reconnect, bool from_reconfigure)
> >  {
> >         struct TCP_Server_Info *pserver;
> >         unsigned int chan_index;
> > @@ -206,14 +206,41 @@ cifs_chan_skip_or_disable(struct cifs_ses *ses,
> >                 return -EHOSTDOWN;
> >         }
> >
> > -       cifs_server_dbg(VFS,
> > -               "server does not support multichannel anymore. Disable =
all other channels\n");
> > -       cifs_disable_secondary_channels(ses);
> > -
> > +       cifs_decrease_secondary_channels(ses, from_reconfigure);
> >
> >         return 0;
> >  }
> >
> > +/*
> > + * smb3_update_ses_channels - Synchronize session channels with new co=
nfiguration
> > + * @ses: pointer to the CIFS session structure
> > + * @server: pointer to the TCP server info structure
> > + * @from_reconnect: indicates if called from reconnect context
> > + * @from_reconfigure: indicates if called from reconfigure context
> > + *
> > + * Returns 0 on success or error code on failure.
> > + *
> > + * Note: Outside of reconfigure, this function is only called from rec=
onnect scenarios
> > + * when the server stops advertising multichannel (MC) capability.
> > + */
>
> I see that function is being called during mount too. Did you
> mean cifs_decrease_secondary_channels()?
>
> > +int smb3_update_ses_channels(struct cifs_ses *ses, struct TCP_Server_I=
nfo *server,
> > +                       bool from_reconnect, bool from_reconfigure)
> > +{
> > +       int rc =3D 0;
> > +       /*
> > +        * If the current channel count is less than the new chan_max,
> > +        * try to add channels to reach the new maximum.
> > +        * Otherwise, disable or skip extra channels to match the new c=
onfiguration.
> > +        */
> > +       if (ses->chan_count < ses->chan_max)
> > +               rc =3D cifs_try_adding_channels(ses);
> > +       else
> > +               rc =3D cifs_chan_skip_or_disable(ses, server, from_reco=
nnect,
> > +                                               from_reconfigure);
> > +
> > +       return rc;
> > +}
> > +
> >  static int
> >  smb2_reconnect(__le16 smb2_command, struct cifs_tcon *tcon,
> >                struct TCP_Server_Info *server, bool from_reconnect)
> > @@ -355,8 +382,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tco=
n *tcon,
> >          */
> >         if (ses->chan_count > 1 &&
> >             !(server->capabilities & SMB2_GLOBAL_CAP_MULTI_CHANNEL)) {
> > -               rc =3D cifs_chan_skip_or_disable(ses, server,
> > -                                              from_reconnect);
> > +               rc =3D smb3_update_ses_channels(ses, server,
> > +                                              from_reconnect, false /*=
 from_reconfigure */);
> >                 if (rc) {
> >                         mutex_unlock(&ses->session_mutex);
> >                         goto out;
> > @@ -438,8 +465,9 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tco=
n *tcon,
> >                          * treat this as server not supporting multicha=
nnel
> >                          */
> >
> > -                       rc =3D cifs_chan_skip_or_disable(ses, server,
> > -                                                      from_reconnect);
> > +                       rc =3D smb3_update_ses_channels(ses, server,
> > +                                                      from_reconnect,
> > +                                                      false /* from_re=
configure */);
> >                         goto skip_add_channels;
> >                 } else if (rc)
> >                         cifs_tcon_dbg(FYI, "%s: failed to query server =
interfaces: %d\n",
> > @@ -451,7 +479,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tco=
n *tcon,
> >                         if (ses->chan_count =3D=3D 1)
> >                                 cifs_server_dbg(VFS, "supports multicha=
nnel now\n");
> >
> > -                       cifs_try_adding_channels(ses);
> > +                       smb3_update_ses_channels(ses, server, from_reco=
nnect,
> > +                                                 false /* from_reconfi=
gure */);
> >                 }
> >         } else {
> >                 mutex_unlock(&ses->session_mutex);
> > @@ -1105,8 +1134,7 @@ SMB2_negotiate(const unsigned int xid,
> >                 req->SecurityMode =3D 0;
> >
> >         req->Capabilities =3D cpu_to_le32(server->vals->req_capabilitie=
s);
> > -       if (ses->chan_max > 1)
> > -               req->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_MULT=
I_CHANNEL);
> > +       req->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_MULTI_CHANNE=
L);
> >
> >         /* ClientGUID must be zero for SMB2.02 dialect */
> >         if (server->vals->protocol_id =3D=3D SMB20_PROT_ID)
> > @@ -1312,8 +1340,7 @@ int smb3_validate_negotiate(const unsigned int xi=
d, struct cifs_tcon *tcon)
> >
> >         pneg_inbuf->Capabilities =3D
> >                         cpu_to_le32(server->vals->req_capabilities);
> > -       if (tcon->ses->chan_max > 1)
> > -               pneg_inbuf->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_C=
AP_MULTI_CHANNEL);
> > +       pneg_inbuf->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_MULTI=
_CHANNEL);
> >
> >         memcpy(pneg_inbuf->Guid, server->client_guid,
> >                                         SMB2_CLIENT_GUID_SIZE);
> > --
> > 2.43.0
> >
> >
>
> Thanks
> Meetakshi
>


--=20
Regards,
Shyam

