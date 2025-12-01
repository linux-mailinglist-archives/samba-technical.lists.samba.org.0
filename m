Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90BC98BC2
	for <lists+samba-technical@lfdr.de>; Mon, 01 Dec 2025 19:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9VxwZaOZyo9aDG2htPrxtzfz0QxBwNsuXkpAX8abSko=; b=d3gv19R4CUH44EY0ydHo6QUrZp
	fApkAluFyZNMRjhB5X+9aIreIZIa9PwmuXdUu+0z/nrcLXFczQ108Gb5P2Wrs3TwP8pC1aRlBkJaK
	PIDhok9vR3AQ3QqJirz+sIBXOWYR9n7q8lMO7xQX79CMTsWnyd5T0HSGDcqdYO71P3M846slgmBbB
	5Fbdmt1hyxYyUsKOmjiw81X7CckIfYN+aMfKhohNJ9hm1BaRvNcEuyX12oVEjky+rcUJBBuj5F2fP
	fh+iDxo0YZmofs2hoGWd6/KBNtXULWN6XEp9hasoSQxTMTqowbriZyrI2APDjs+IPbqB4Bhuz1Wpe
	il+/bTng==;
Received: from ip6-localhost ([::1]:59454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vQ8kl-00FY8P-9U; Mon, 01 Dec 2025 18:36:03 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:47320) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQ8ke-00FY8I-3V
 for samba-technical@lists.samba.org; Mon, 01 Dec 2025 18:35:59 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-88059c28da1so44397386d6.2
 for <samba-technical@lists.samba.org>; Mon, 01 Dec 2025 10:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764614154; x=1765218954; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VxwZaOZyo9aDG2htPrxtzfz0QxBwNsuXkpAX8abSko=;
 b=DwJwCtMEjg5E0inQG35gFGbY1ek2HMUzZ5npANE6h2xjVM3XY4mSAdRAWd7FMA9dQq
 to5iUsQ5lUNlsAujAQVOZdmSkslBsAmpee0lJ7v9CJyz8G27xukzzfAPPyJPZQcqjQgE
 d6nZLcIOBtxNqk8W3qr/X5weGeaw3t7MXSy9kK02wLPW7MeEGQsgyGQ7f/odt+mFH3RP
 QEgpi7F1mqVAU9wBjyP+ZKDMfrTpTtBq7wIDDWLTGXloXEOCBQqFYZlyjIRP2eGPhx3R
 muvYGyxYuc4pQVKG3g1xtVwLP9egHZibhsAvMH6vlaKvkWhTv6pEVx3nnoaFb9uT8bpR
 rYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764614154; x=1765218954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9VxwZaOZyo9aDG2htPrxtzfz0QxBwNsuXkpAX8abSko=;
 b=cx1lwZynK+2HjARs3srpHVT0XSmFzoQ8h7ForgaWiE0He/P8GKNvXnVGINZJtMNiJW
 HY8aeztELOIbzQknBBkcxL/7S5WtXYWHsjWZdeKzRQFVqLv2lg4nEJzjUEB7jwUDAa18
 dguHqvFj7Et80qNhu2sK0D0ugPqPqizwU9iOCynvycJijUYKorAMRMv7ETvYXF6omTXP
 qhzPB7Z4YuzbFWeKVAktoSSxVWk8bf3T0gheGcHmOy8W50jSG9F2sVTVxGJozL2Zl3mq
 Zhu0xiL3YuHm/E6drV7eOzl9k5xNHTaiGHME+fFJlWAimRoU4nD+jiKryf9cYCmbmq10
 lhLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVe521NRcldQ47Q+nYlZcGuOD0HxuVXoMPZEf5v7MR9usZexDmQdLPPEGzsXVAAkrsb2fFQAYcgi/HZCMSq94=@lists.samba.org
X-Gm-Message-State: AOJu0YxYCUY5FMamgAAQzDSIFyZDf117RdnXBEOeeA2Br9mOTYXL252T
 dnuogh07/VhHsdtoIp8Q+alsHOzDbY+y4ie3pkWviR0zo/8y/naOwQr/OSGfrgXDjFVUp1Vix6W
 Pc2uncHjcSmZio6f8gOsbveBB4N8RktM=
X-Gm-Gg: ASbGncttOVyeH/sIXaAWUXwWzEctkK0iTRUytBEFvwEAm5ySXOTFTWpPc+i5bmEUYtD
 wr9WdYca/VHrrH7K6HPwUk1zp2RUpQ7wSkct7hZQAaUkSXJNhBwpB5+0/BTOKYQz6Pa1BSQVbX9
 DdwXV8EU3NoniXdWIGTDYfhM3Oxtv0KDaCyju018U38QY9j5JgHkZctg5XPP0Pva9unOGP7LRqZ
 rWCUHKeY/lliiDqvkmHjx7qqhumB4bMz0jhEdRYSo6L6OdcJuQGuH/uPv8z6u0Uudu3+FNMYET5
 dkP9jkfkm2EOmGh80Ik2fQ0n0ENDNKkpT36RoIHIMU1FvbMJomR37Q2HLMBdCaq5VvtShGKRPmL
 w5eRsfb2fd3fqR+gzG/0yxc/xlfLMM1EtqZlgil1naFAiPsedLA2IMDctkrzw+lvGLPGtbyHt2j
 th6LaHij6v
X-Google-Smtp-Source: AGHT+IEifdzvlBbShHTTNczrcMQPA+4yFPlm5DVOrIznDRLOHeCcfaZkCtmyesDCZBmDvTIDkVyKBw+xhnorKXHaff4=
X-Received: by 2002:a05:6214:f06:b0:87c:23f3:5651 with SMTP id
 6a1803df08f44-8847c57ddccmr605031776d6.67.1764614154023; Mon, 01 Dec 2025
 10:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20251118022655.126994-1-rajasimandalos@gmail.com>
 <CAFTVevWRXF8TCDQstp7r1uu8eZ21M4m1EPs3zXANPTDj8bh_ZQ@mail.gmail.com>
 <CANT5p=ohMvQ+0+YYCQrkSw7sPW24gs60TQzBoiAyfedO8GXgfQ@mail.gmail.com>
 <CAEY6_V2Rc_yBSTL3ozK1TJo-qM0HixeE5kgXiPuOS5g2MZAErg@mail.gmail.com>
In-Reply-To: <CAEY6_V2Rc_yBSTL3ozK1TJo-qM0HixeE5kgXiPuOS5g2MZAErg@mail.gmail.com>
Date: Mon, 1 Dec 2025 12:35:40 -0600
X-Gm-Features: AWmQ_bn1giCCmPGRb-0N9QOLxGis9enP1O6xr2fU8NuvCUqGD09AIzxgJhtBey0
Message-ID: <CAH2r5mtHDDe9pkbeR3iTCzoQJBShSGiNB7aj5H9fNX50zPmP2Q@mail.gmail.com>
Subject: Re: [PATCH] cifs: client: allow changing multichannel mount options
 on remount
To: RAJASI MANDAL <rajasimandalos@gmail.com>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sprasad@microsoft.com,
 pc@manguebit.org, linux-cifs@vger.kernel.org,
 Rajasi Mandal <rajasimandal@microsoft.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 tom@talpey.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged the two patches into ksmbd-for-next (will move to cifs-2.6.git
for-next once the next P/R is complete, but want to avoid merge
conflicts for now) pending additional testing and review

On Mon, Dec 1, 2025 at 3:21=E2=80=AFAM RAJASI MANDAL <rajasimandalos@gmail.=
com> wrote:
>
> Sending a follow-up patch with corrected comment as pointed out by Meetak=
shi. Attaching the new patch here for easy reference.
>
> Regards,
> Rajasi
>
> On Mon, Nov 24, 2025 at 5:20=E2=80=AFPM Shyam Prasad N <nspmangalore@gmai=
l.com> wrote:
>>
>> On Thu, Nov 20, 2025 at 11:40=E2=80=AFAM Meetakshi Setiya
>> <meetakshisetiyaoss@gmail.com> wrote:
>> >
>> > Hi Rajasi,
>> >
>> > On Tue, Nov 18, 2025 at 7:59=E2=80=AFAM Rajasi Mandal <rajasimandalos@=
gmail.com> wrote:
>> > >
>> > > From: Rajasi Mandal <rajasimandal@microsoft.com>
>> > >
>> > > Previously, the client did not update a session's channel state when
>> > > multichannel or max_channels mount options were changed via remount.
>> > > This led to inconsistent behavior and prevented enabling or disablin=
g
>> > > multichannel support without a full unmount/remount cycle.
>> > >
>> > > Enable dynamic reconfiguration of multichannel and max_channels duri=
ng
>> > > remount by:
>> > > - Introducing smb3_sync_ses_chan_max(), a centralized function for
>> > >   channel updates which synchronizes the session's channels with the
>> > >   updated configuration.
>> > > - Replacing cifs_disable_secondary_channels() with
>> > >   cifs_decrease_secondary_channels(), which accepts a from_reconfigu=
re
>> > >   flag to support targeted cleanup during reconfiguration.
>> > > - Updating remount logic to detect changes in multichannel or
>> > >   max_channels and trigger appropriate session/channel updates.
>> > >
>> > > Current limitation:
>> > > - The query_interfaces worker runs even when max_channels=3D1 so tha=
t
>> > >   multichannel can be enabled later via remount without requiring an
>> > >   unmount. This is a temporary approach and may be refined in the
>> > >   future.
>> > >
>> > > Users can safely modify multichannel and max_channels on an existing
>> > > mount. The client will correctly adjust the session's channel state =
to
>> > > match the new configuration, preserving durability where possible an=
d
>> > > avoiding unnecessary disconnects.
>> > >
>> > > Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
>> > > Signed-off-by: Rajasi Mandal <rajasimandal@microsoft.com>
>> > > ---
>> > >  fs/smb/client/cifsproto.h  |  4 ++-
>> > >  fs/smb/client/connect.c    |  4 ++-
>> > >  fs/smb/client/fs_context.c | 50 +++++++++++++++++++++++++++++++++-
>> > >  fs/smb/client/sess.c       | 32 +++++++++++++++-------
>> > >  fs/smb/client/smb2pdu.c    | 55 ++++++++++++++++++++++++++++-------=
---
>> > >  5 files changed, 119 insertions(+), 26 deletions(-)
>> > >
>> > > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
>> > > index 3528c365a452..a1fc9e1918bc 100644
>> > > --- a/fs/smb/client/cifsproto.h
>> > > +++ b/fs/smb/client/cifsproto.h
>> > > @@ -649,6 +649,8 @@ int cifs_alloc_hash(const char *name, struct sha=
sh_desc **sdesc);
>> > >  void cifs_free_hash(struct shash_desc **sdesc);
>> > >
>> > >  int cifs_try_adding_channels(struct cifs_ses *ses);
>> > > +int smb3_update_ses_channels(struct cifs_ses *ses, struct TCP_Serve=
r_Info *server,
>> > > +                                       bool from_reconnect, bool fr=
om_reconfigure);
>> > >  bool is_ses_using_iface(struct cifs_ses *ses, struct cifs_server_if=
ace *iface);
>> > >  void cifs_ses_mark_for_reconnect(struct cifs_ses *ses);
>> > >
>> > > @@ -674,7 +676,7 @@ bool
>> > >  cifs_chan_is_iface_active(struct cifs_ses *ses,
>> > >                           struct TCP_Server_Info *server);
>> > >  void
>> > > -cifs_disable_secondary_channels(struct cifs_ses *ses);
>> > > +cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_re=
configure);
>> > >  void
>> > >  cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info=
 *server);
>> > >  int
>> > > diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
>> > > index 55cb4b0cbd48..cebe4a5f54f2 100644
>> > > --- a/fs/smb/client/connect.c
>> > > +++ b/fs/smb/client/connect.c
>> > > @@ -3927,7 +3927,9 @@ int cifs_mount(struct cifs_sb_info *cifs_sb, s=
truct smb3_fs_context *ctx)
>> > >         ctx->prepath =3D NULL;
>> > >
>> > >  out:
>> > > -       cifs_try_adding_channels(mnt_ctx.ses);
>> > > +       smb3_update_ses_channels(mnt_ctx.ses, mnt_ctx.server,
>> > > +                                 false /* from_reconnect */,
>> > > +                                 false /* from_reconfigure */);
>> >
>> > Shouldn't this be added to the non-dfs cifs_mount() too? I see that
>> > even cifs_try_adding_channels() is not present in this function,
>> > @Shyam Prasad is this expected?
>>
>> That's a good catch.
>> I think this is a day-0 bug.
>> I can see that the original change by Aurelien has the change only in
>> DFS cifs_mount:
>> commit d70e9fa55884760b6d6c293dbf20d8c52ce11fb7
>> Author: Aurelien Aptel <aaptel@suse.com>
>> Date:   Fri Sep 20 06:31:10 2019 +0200
>>
>>     cifs: try opening channels after mounting
>>
>> We should have a follow-up patch to fix this.
>>
>> >
>> > >         rc =3D mount_setup_tlink(cifs_sb, mnt_ctx.ses, mnt_ctx.tcon)=
;
>> > >         if (rc)
>> > >                 goto error;
>> > > diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
>> > > index 0f894d09157b..751ed6ebd458 100644
>> > > --- a/fs/smb/client/fs_context.c
>> > > +++ b/fs/smb/client/fs_context.c
>> > > @@ -717,6 +717,7 @@ static int smb3_fs_context_parse_param(struct fs=
_context *fc,
>> > >  static int smb3_fs_context_parse_monolithic(struct fs_context *fc,
>> > >                                             void *data);
>> > >  static int smb3_get_tree(struct fs_context *fc);
>> > > +static void smb3_sync_ses_chan_max(struct cifs_ses *ses, unsigned i=
nt max_channels);
>> > >  static int smb3_reconfigure(struct fs_context *fc);
>> > >
>> > >  static const struct fs_context_operations smb3_fs_context_ops =3D {
>> > > @@ -1013,6 +1014,22 @@ int smb3_sync_session_ctx_passwords(struct ci=
fs_sb_info *cifs_sb, struct cifs_se
>> > >         return 0;
>> > >  }
>> > >
>> > > +/*
>> > > + * smb3_sync_ses_chan_max - Synchronize the session's maximum chann=
el count
>> > > + * @ses: pointer to the old CIFS session structure
>> > > + * @max_channels: new maximum number of channels to allow
>> > > + *
>> > > + * Updates the session's chan_max field to the new value, protectin=
g the update
>> > > + * with the session's channel lock. This should be called whenever =
the maximum
>> > > + * allowed channels for a session changes (e.g., after a remount or=
 reconfigure).
>> > > + */
>> > > +static void smb3_sync_ses_chan_max(struct cifs_ses *ses, unsigned i=
nt max_channels)
>> > > +{
>> > > +       spin_lock(&ses->chan_lock);
>> > > +       ses->chan_max =3D max_channels;
>> > > +       spin_unlock(&ses->chan_lock);
>> > > +}
>> > > +
>> > >  static int smb3_reconfigure(struct fs_context *fc)
>> > >  {
>> > >         struct smb3_fs_context *ctx =3D smb3_fc2context(fc);
>> > > @@ -1095,7 +1112,38 @@ static int smb3_reconfigure(struct fs_context=
 *fc)
>> > >                 ses->password2 =3D new_password2;
>> > >         }
>> > >
>> > > -       mutex_unlock(&ses->session_mutex);
>> > > +       /*
>> > > +        * If multichannel or max_channels has changed, update the s=
ession's channels accordingly.
>> > > +        * This may add or remove channels to match the new configur=
ation.
>> > > +        */
>> > > +       if ((ctx->multichannel !=3D cifs_sb->ctx->multichannel) ||
>> > > +           (ctx->max_channels !=3D cifs_sb->ctx->max_channels)) {
>> > > +
>> > > +               /* Synchronize ses->chan_max with the new mount cont=
ext */
>> > > +               smb3_sync_ses_chan_max(ses, ctx->max_channels);
>> > > +               /* Now update the session's channels to match the ne=
w configuration */
>> > > +               /* Prevent concurrent scaling operations */
>> > > +               spin_lock(&ses->ses_lock);
>> > > +               if (ses->flags & CIFS_SES_FLAG_SCALE_CHANNELS) {
>> > > +                       spin_unlock(&ses->ses_lock);
>> > > +                       return -EINVAL;
>> > > +               }
>> > > +               ses->flags |=3D CIFS_SES_FLAG_SCALE_CHANNELS;
>> > > +               spin_unlock(&ses->ses_lock);
>> > > +
>> > > +               mutex_unlock(&ses->session_mutex);
>> > > +
>> > > +               rc =3D smb3_update_ses_channels(ses, ses->server,
>> > > +                                              false /* from_reconne=
ct */,
>> > > +                                              true /* from_reconfig=
ure */);
>> > > +
>> > > +               /* Clear scaling flag after operation */
>> > > +               spin_lock(&ses->ses_lock);
>> > > +               ses->flags &=3D ~CIFS_SES_FLAG_SCALE_CHANNELS;
>> > > +               spin_unlock(&ses->ses_lock);
>> > > +       } else {
>> > > +               mutex_unlock(&ses->session_mutex);
>> > > +       }
>> > >
>> > >         STEAL_STRING(cifs_sb, ctx, domainname);
>> > >         STEAL_STRING(cifs_sb, ctx, nodename);
>> > > diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
>> > > index ef3b498b0a02..cfd83986a84a 100644
>> > > --- a/fs/smb/client/sess.c
>> > > +++ b/fs/smb/client/sess.c
>> > > @@ -265,12 +265,16 @@ int cifs_try_adding_channels(struct cifs_ses *=
ses)
>> > >  }
>> > >
>> > >  /*
>> > > - * called when multichannel is disabled by the server.
>> > > - * this always gets called from smb2_reconnect
>> > > - * and cannot get called in parallel threads.
>> > > + * cifs_decrease_secondary_channels - Reduce the number of active s=
econdary channels
>> > > + * @ses: pointer to the CIFS session structure
>> > > + * @from_reconfigure: if true, only reduce to chan_max; if false, r=
educe to a single channel
>> > > + *
>> > > + * This function disables and cleans up extra secondary channels fo=
r a CIFS session.
>> > > + * If called during reconfiguration, it reduces the channel count t=
o the new maximum (chan_max).
>> > > + * Otherwise, it disables all but the primary channel.
>> > >   */
>> > >  void
>> > > -cifs_disable_secondary_channels(struct cifs_ses *ses)
>> > > +cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_re=
configure)
>> > >  {
>> > >         int i, chan_count;
>> > >         struct TCP_Server_Info *server;
>> > > @@ -281,12 +285,13 @@ cifs_disable_secondary_channels(struct cifs_se=
s *ses)
>> > >         if (chan_count =3D=3D 1)
>> > >                 goto done;
>> > >
>> > > -       ses->chan_count =3D 1;
>> > > -
>> > > -       /* for all secondary channels reset the need reconnect bit *=
/
>> > > -       ses->chans_need_reconnect &=3D 1;
>> > > +       /* Update the chan_count to the new maximum */
>> > > +       if (from_reconfigure)
>> > > +               ses->chan_count =3D ses->chan_max;
>> > > +       else
>> > > +               ses->chan_count =3D 1;
>> > >
>> > > -       for (i =3D 1; i < chan_count; i++) {
>> > > +       for (i =3D ses->chan_max ; i < chan_count; i++) {
>> > >                 iface =3D ses->chans[i].iface;
>> > >                 server =3D ses->chans[i].server;
>> > >
>> > > @@ -318,6 +323,15 @@ cifs_disable_secondary_channels(struct cifs_ses=
 *ses)
>> > >                 spin_lock(&ses->chan_lock);
>> > >         }
>> > >
>> > > +       /* For extra secondary channels, reset the need reconnect bi=
t */
>> > > +       if (ses->chan_count =3D=3D 1) {
>> > > +               cifs_dbg(VFS, "server does not support multichannel =
anymore. Disable all other channels\n");
>> > > +               ses->chans_need_reconnect &=3D 1;
>> > > +       } else {
>> > > +               cifs_dbg(VFS, "Disable extra secondary channels\n");
>> > > +               ses->chans_need_reconnect &=3D ((1UL << ses->chan_ma=
x) - 1);
>> > > +       }
>> > > +
>> > >  done:
>> > >         spin_unlock(&ses->chan_lock);
>> > >  }
>> > > diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
>> > > index 8b4a4573e9c3..d051da46eaab 100644
>> > > --- a/fs/smb/client/smb2pdu.c
>> > > +++ b/fs/smb/client/smb2pdu.c
>> > > @@ -168,7 +168,7 @@ smb2_hdr_assemble(struct smb2_hdr *shdr, __le16 =
smb2_cmd,
>> > >  static int
>> > >  cifs_chan_skip_or_disable(struct cifs_ses *ses,
>> > >                           struct TCP_Server_Info *server,
>> > > -                         bool from_reconnect)
>> > > +                         bool from_reconnect, bool from_reconfigure=
)
>> > >  {
>> > >         struct TCP_Server_Info *pserver;
>> > >         unsigned int chan_index;
>> > > @@ -206,14 +206,41 @@ cifs_chan_skip_or_disable(struct cifs_ses *ses=
,
>> > >                 return -EHOSTDOWN;
>> > >         }
>> > >
>> > > -       cifs_server_dbg(VFS,
>> > > -               "server does not support multichannel anymore. Disab=
le all other channels\n");
>> > > -       cifs_disable_secondary_channels(ses);
>> > > -
>> > > +       cifs_decrease_secondary_channels(ses, from_reconfigure);
>> > >
>> > >         return 0;
>> > >  }
>> > >
>> > > +/*
>> > > + * smb3_update_ses_channels - Synchronize session channels with new=
 configuration
>> > > + * @ses: pointer to the CIFS session structure
>> > > + * @server: pointer to the TCP server info structure
>> > > + * @from_reconnect: indicates if called from reconnect context
>> > > + * @from_reconfigure: indicates if called from reconfigure context
>> > > + *
>> > > + * Returns 0 on success or error code on failure.
>> > > + *
>> > > + * Note: Outside of reconfigure, this function is only called from =
reconnect scenarios
>> > > + * when the server stops advertising multichannel (MC) capability.
>> > > + */
>> >
>> > I see that function is being called during mount too. Did you
>> > mean cifs_decrease_secondary_channels()?
>> >
>> > > +int smb3_update_ses_channels(struct cifs_ses *ses, struct TCP_Serve=
r_Info *server,
>> > > +                       bool from_reconnect, bool from_reconfigure)
>> > > +{
>> > > +       int rc =3D 0;
>> > > +       /*
>> > > +        * If the current channel count is less than the new chan_ma=
x,
>> > > +        * try to add channels to reach the new maximum.
>> > > +        * Otherwise, disable or skip extra channels to match the ne=
w configuration.
>> > > +        */
>> > > +       if (ses->chan_count < ses->chan_max)
>> > > +               rc =3D cifs_try_adding_channels(ses);
>> > > +       else
>> > > +               rc =3D cifs_chan_skip_or_disable(ses, server, from_r=
econnect,
>> > > +                                               from_reconfigure);
>> > > +
>> > > +       return rc;
>> > > +}
>> > > +
>> > >  static int
>> > >  smb2_reconnect(__le16 smb2_command, struct cifs_tcon *tcon,
>> > >                struct TCP_Server_Info *server, bool from_reconnect)
>> > > @@ -355,8 +382,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_=
tcon *tcon,
>> > >          */
>> > >         if (ses->chan_count > 1 &&
>> > >             !(server->capabilities & SMB2_GLOBAL_CAP_MULTI_CHANNEL))=
 {
>> > > -               rc =3D cifs_chan_skip_or_disable(ses, server,
>> > > -                                              from_reconnect);
>> > > +               rc =3D smb3_update_ses_channels(ses, server,
>> > > +                                              from_reconnect, false=
 /* from_reconfigure */);
>> > >                 if (rc) {
>> > >                         mutex_unlock(&ses->session_mutex);
>> > >                         goto out;
>> > > @@ -438,8 +465,9 @@ smb2_reconnect(__le16 smb2_command, struct cifs_=
tcon *tcon,
>> > >                          * treat this as server not supporting multi=
channel
>> > >                          */
>> > >
>> > > -                       rc =3D cifs_chan_skip_or_disable(ses, server=
,
>> > > -                                                      from_reconnec=
t);
>> > > +                       rc =3D smb3_update_ses_channels(ses, server,
>> > > +                                                      from_reconnec=
t,
>> > > +                                                      false /* from=
_reconfigure */);
>> > >                         goto skip_add_channels;
>> > >                 } else if (rc)
>> > >                         cifs_tcon_dbg(FYI, "%s: failed to query serv=
er interfaces: %d\n",
>> > > @@ -451,7 +479,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_=
tcon *tcon,
>> > >                         if (ses->chan_count =3D=3D 1)
>> > >                                 cifs_server_dbg(VFS, "supports multi=
channel now\n");
>> > >
>> > > -                       cifs_try_adding_channels(ses);
>> > > +                       smb3_update_ses_channels(ses, server, from_r=
econnect,
>> > > +                                                 false /* from_reco=
nfigure */);
>> > >                 }
>> > >         } else {
>> > >                 mutex_unlock(&ses->session_mutex);
>> > > @@ -1105,8 +1134,7 @@ SMB2_negotiate(const unsigned int xid,
>> > >                 req->SecurityMode =3D 0;
>> > >
>> > >         req->Capabilities =3D cpu_to_le32(server->vals->req_capabili=
ties);
>> > > -       if (ses->chan_max > 1)
>> > > -               req->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_M=
ULTI_CHANNEL);
>> > > +       req->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_MULTI_CHA=
NNEL);
>> > >
>> > >         /* ClientGUID must be zero for SMB2.02 dialect */
>> > >         if (server->vals->protocol_id =3D=3D SMB20_PROT_ID)
>> > > @@ -1312,8 +1340,7 @@ int smb3_validate_negotiate(const unsigned int=
 xid, struct cifs_tcon *tcon)
>> > >
>> > >         pneg_inbuf->Capabilities =3D
>> > >                         cpu_to_le32(server->vals->req_capabilities);
>> > > -       if (tcon->ses->chan_max > 1)
>> > > -               pneg_inbuf->Capabilities |=3D cpu_to_le32(SMB2_GLOBA=
L_CAP_MULTI_CHANNEL);
>> > > +       pneg_inbuf->Capabilities |=3D cpu_to_le32(SMB2_GLOBAL_CAP_MU=
LTI_CHANNEL);
>> > >
>> > >         memcpy(pneg_inbuf->Guid, server->client_guid,
>> > >                                         SMB2_CLIENT_GUID_SIZE);
>> > > --
>> > > 2.43.0
>> > >
>> > >
>> >
>> > Thanks
>> > Meetakshi
>> >
>>
>>
>> --
>> Regards,
>> Shyam



--=20
Thanks,

Steve

