Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83328228EE0
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jul 2020 06:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kIcQ2hLEI2qwafAokNHYuqlGOTYh/mA9XiM0pFfW1Lo=; b=b3B7UC7scGKIWZY42FOY+iuQA+
	R/dKd3uOe/ZRIvBgZ55JKTpbgYLWyl10928N1zxBXIeaVkUZp6Ut/K7cnraJrwmWYvP9ANZuenX/h
	zq00gpSqkdYFn8RqbvgKZ9gcknMdzOlN1e42LDUFwgGDwWAxGczYxVfAqtdLdw+IKZHINPLfyIsl9
	Ebd/cFzUJ6oI/NY21Do6Awp4YfNDyaozPlSAeqXCGDEXDFABrUL9oY70v704qg6MfBeHoVIMVz9EL
	DLK6OhHh4Iw6zI7vFw3FgmHcQoMzzBkKqf0TVxTlNxNqxfrWmYnujZI6lbXrEOhFfN/MTTiDImvTP
	1bcrAGYw==;
Received: from localhost ([::1]:46044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jy5yd-0096Fc-VO; Wed, 22 Jul 2020 04:03:32 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jy5yV-0096FV-LW
 for samba-technical@lists.samba.org; Wed, 22 Jul 2020 04:03:27 +0000
Received: by mail-io1-xd44.google.com with SMTP id d18so1161559ion.0
 for <samba-technical@lists.samba.org>; Tue, 21 Jul 2020 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kIcQ2hLEI2qwafAokNHYuqlGOTYh/mA9XiM0pFfW1Lo=;
 b=vF3R5O5+AJ4RMNKHl7XA09vns0lHFdS6x7Vs5SpAY8ylVSXX9czd/bOVE19BF+dyCs
 z4dhtgk51yyQg+zgdsmE6tQAKsQiPvWeoIkg/6yzq/FFL01GrIkERXWin7MrUMayBi9+
 TvbICrlxcYbHVwBhcDozlkW1vMXzzOnQ2UWWlY27Ry/y7elGkECTkMdwGsxESDWghJ5D
 eo6b954I6zLm+7XJNji50fygTvEbGIhoDqz+aRgrev4GBrxYXnOpcs+Dq1wqUl5HL3xn
 JUX7aPynTw/uQ1RFrEmjFjSFp1OQ44s5E2hr333sQcetakpP4fMwASYhrCuSr6qDGFwD
 5Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kIcQ2hLEI2qwafAokNHYuqlGOTYh/mA9XiM0pFfW1Lo=;
 b=jOSataOKTBu1wFrvYVrCyoxVdId90bAk5NAAjToc/t6cjOQ8rpK6cB5LGaLylOx/pK
 aqFGCYULtcZ7iovetMwY74oIHAL7iy+KY2PCS0cSffSexE4vjSRJsogPlrjo+EluP2wI
 nwpkwItfj4AGwFXwm9r04iB+8bOAckn/BvFga82oc5Le7b8uzGLInCsi7l5+MWE+8Ikd
 2y3+1nTw0lS3kvm6l+QF2QOocFTPUOOmsPxZCkDGdHp/2VCBuqcmHhjY17ihATDhawxd
 G1S78xATEf+COsG5I3PBoTUu9BwBrCbv2AYou1wUWEjLLAInx5Qv3UdHEFeWsG4y8LsP
 L5Vg==
X-Gm-Message-State: AOAM530glGOND4+cwRrhFI9Yg+yBJ49x0jGgYezPZFIHmbFeRmPSrti0
 F13w1/hNFL0MrxbhkA5aZr+1BPlbbNo4JeGzSK4=
X-Google-Smtp-Source: ABdhPJzeSN1lM/V4FFBZ0FUkJ8RkqaUYfo3to/k6rPz3sjv8xunUWPG7XMvT0+myTlGJXlrVrafi8r4m3LwdPSiTqYk=
X-Received: by 2002:a05:6638:1414:: with SMTP id
 k20mr26569477jad.76.1595390601557; 
 Tue, 21 Jul 2020 21:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <b14432a4-bb8c-7a0f-4339-b7e6ddec9b4a@arrl.org>
 <CAH2r5msj3KMMonyhjDeyAweHEBezOHFkJwCUXpJ4Gv59Q=S9bQ@mail.gmail.com>
 <752d5d05-7b91-b119-b5a6-7fcdeb1f0ced@arrl.org>
 <CAH2r5muNtwm3V-0GpaRBXmrptGDO9w1vDSWN9Wrf_eebuevg6A@mail.gmail.com>
 <61450b64-ed70-6b8f-2beb-57267ddcb8c5@arrl.org>
 <CAH2r5mu-g-RrR9Q4ghmqjkd-mbXbfeJE=HgVSaEEosCyBNoO8Q@mail.gmail.com>
 <119a0298-4099-c65e-30db-746814e36cce@arrl.org>
In-Reply-To: <119a0298-4099-c65e-30db-746814e36cce@arrl.org>
Date: Tue, 21 Jul 2020 23:03:10 -0500
Message-ID: <CAH2r5muepeJcNHHBUnV=ToHUYnud9KbfkKq1P17L=J4Ev2L+vw@mail.gmail.com>
Subject: Re: issue -- cifs automounts stopped working
To: "Michael Keane, K1MK" <mkeane@arrl.org>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There are two common Kerberos libraries, MIT and Heimdal (Heimdal is
also packaged as an optional part of Samba as an alternative to MIT
Kerberos) ... would be interesting if there is a way to work around
this by switching to Heimdal krb5 libraries.

Adding samba-technical as some of the developers on samba-technical
know the Kerberos maintainers and may have suggestions on how to track
down this possible regression in MIT kerberos.

On Tue, Jul 21, 2020 at 10:48 PM Michael Keane, K1MK <mkeane@arrl.org> wrot=
e:
>
> Tried setting KRB5_CCNAME to KEYRING:persistent:1000 with no change
> (Also tried KRB5CCNAME  as well, as that's the environment variable
> which seems to work with kinit & klist)
>
> Also tried setting default_ccahe_name in /etc/krb5.conf to a legacy
> value of
>
>      default_ccache_name =3D /tmp/krb5_%{uid}
>
> in order to force it to use the filesystem rather than the kernel space
> for the credentials cache. And it still fails in the same way. I think
> that tends to makes this more likely a regression in krb5 than the kernel=
.
>
> I believe that I may have verified this by reverting from
> krb5-*/-/1.18.2-10 to krb5-*-1.17.1-5 which resolves the issue
>
>
>
> On 07/21/2020 3:59 PM, Steve French wrote:
> > Would setting KRB5_CCNAME (as would be expected in the past) for that
> > process fix the issue?
> >
> > On Tue, Jul 21, 2020 at 2:52 PM Michael Keane, K1MK <mkeane@arrl.org> w=
rote:
> >> KRB5_CCNAME is not set in the environment of the user for whom the
> >> automount is failing.
> >>
> >> In /etc/krb5.conf the default is set to:
> >>
> >>      default_ccache_name =3D KEYRING:persistent:%{uid}
> >>
> >> The calls to keyctl()  in the strace for cifs.upcall  indicate that it=
's
> >> successfully locating the user's keyring in the kernel and that it is
> >> able to read key data from that keying
> >>
> >> I haven't gone through and tried unpacking and decoding the contents o=
f
> >> those reads, but the reads aren't failing outright like it couldn't fi=
nd
> >> the credentials cache or the contents that it's looking for
> >>
> >>
> >> On 07/21/2020 1:36 PM, Steve French wrote:
> >>> That is plausible but I also wonder about other whether other parts o=
f
> >>> krb5 configuration are changed/broken eg KRB5_CCNAME environment vari=
able
> >>>
> >>> See https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html
> >>>
> >>> On Tue, Jul 21, 2020, 12:24 Michael Keane, K1MK <mkeane@arrl.org
> >>> <mailto:mkeane@arrl.org>> wrote:
> >>>
> >>>      Thanks
> >>>
> >>>      In trying to further debug this problem, I've stood up a separat=
e
> >>>      Fedora 31 instance for testing with the result that the same
> >>>      configuration that is failing on Fedora 32 is working under Fedo=
ra 31
> >>>
> >>>      Using strace it would appear the deviation occurs at the point o=
f
> >>>      "handle_krb5_mech" where the Fedora 31 instance proceeds though
> >>>      several keyctl() calls to a successful return while the Fedora 3=
2
> >>>      instance goes through a similar sequence of keyctl() calls but
> >>>      rather than finishing up with a final call to keyctl() to
> >>>      instantiate the key it appears that the krb5 library and/or sssd
> >>>      is going through a series of steps to locate the KDC (and failin=
g)
> >>>      even though the KDCs have always been explicitly configured in
> >>>      /etc/krb5.conf
> >>>
> >>>      So the root cause of this issue may not be anything in cifs.upca=
ll
> >>>      but rather something in the sssd or kerberos that got changed as=
 a
> >>>      result of moving from Fedora 31 to Fedora 32
> >>>
> >>>      On 07/18/2020 8:40 PM, Steve French wrote:
> >>>>      Looks like error obtaining the key (either keyutils package not
> >>>>      installed or no Kerberos ticket found).
> >>>>
> >>>>      This page has debug instructions for cifs.upcall. see of that
> >>>>      information is helpful.
> >>>>
> >>>>      http://sprabhu.blogspot.com/2014/12/debugging-calls-to-cifsupca=
ll.html?m=3D1
> >>>>
> >>>>      Also try kinit as a local user and then mount with cruid mount
> >>>>      option pointing to their uid to see if that helps.
> >>>>
> >>>>      On Fri, Jul 17, 2020, 09:04 Michael Keane, K1MK <mkeane@arrl.or=
g
> >>>>      <mailto:mkeane@arrl.org>> wrote:
> >>>>
> >>>>          CIFS automounts to local NAS devices have stopped working
> >>>>          recently
> >>>>
> >>>>          Fedora 32
> >>>>
> >>>>          kernel 5.7.8-200.fc32.x86_64
> >>>>
> >>>>          mount.cifs version: 6.9
> >>>>
> >>>>          auto.misc: it-share
> >>>>          -fstype=3Dcifs,multiuser,cruid=3D${UID},rw,vers=3Ddefault,s=
ec=3Dkrb5
> >>>>          ://filer5/IT_Share
> >>>>
> >>>>          dmesg:
> >>>>
> >>>>              [ 3428.883661] fs/cifs/cifsfs.c: Devname:
> >>>>              //filer5.arrlhq.org/IT_Share
> >>>>          <http://filer5.arrlhq.org/IT_Share> flags: 0
> >>>>              [ 3428.883702] fs/cifs/connect.c: Username: root
> >>>>              [ 3428.883706] fs/cifs/connect.c: file mode: 0755 dir
> >>>>          mode: 0755
> >>>>              [ 3428.883709] fs/cifs/connect.c: CIFS VFS: in
> >>>>          mount_get_conns as
> >>>>              Xid: 12 with uid: 0
> >>>>              [ 3428.883710] fs/cifs/connect.c: UNC:
> >>>>          \\filer5.arrlhq.org <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3428.883721] fs/cifs/connect.c: Socket created
> >>>>              [ 3428.883723] fs/cifs/connect.c: sndbuf 16384 rcvbuf 1=
31072
> >>>>              rcvtimeo 0x1b58
> >>>>              [ 3428.884126] fs/cifs/fscache.c:
> >>>>          cifs_fscache_get_client_cookie:
> >>>>              (0x000000006d2b3226/0x0000000090edec3a)
> >>>>              [ 3428.884130] fs/cifs/connect.c: CIFS VFS: in
> >>>>          cifs_get_smb_ses as
> >>>>              Xid: 13 with uid: 0
> >>>>              [ 3428.884131] fs/cifs/connect.c: Existing smb sess not=
 found
> >>>>              [ 3428.884135] fs/cifs/smb2pdu.c: Negotiate protocol
> >>>>              [ 3428.884141] fs/cifs/connect.c: Demultiplex PID: 5778
> >>>>              [ 3428.884156] fs/cifs/transport.c: Sending smb: smb_le=
n=3D252
> >>>>              [ 3429.010818] fs/cifs/connect.c: RFC1002 header 0x11c
> >>>>              [ 3429.010830] fs/cifs/smb2misc.c: SMB2 data length 96
> >>>>          offset 128
> >>>>              [ 3429.010832] fs/cifs/smb2misc.c: SMB2 len 224
> >>>>              [ 3429.010835] fs/cifs/smb2misc.c: length of negcontext=
s
> >>>>          60 pad 0
> >>>>              [ 3429.010871] fs/cifs/transport.c: cifs_sync_mid_resul=
t:
> >>>>          cmd=3D0
> >>>>              mid=3D0 state=3D4
> >>>>              [ 3429.010885] fs/cifs/misc.c: Null buffer passed to
> >>>>              cifs_small_buf_release
> >>>>              [ 3429.010891] fs/cifs/smb2pdu.c: mode 0x1
> >>>>              [ 3429.010893] fs/cifs/smb2pdu.c: negotiated smb3.1.1 d=
ialect
> >>>>              [ 3429.010903] fs/cifs/asn1.c: OID len =3D 7 oid =3D 0x=
1 0x2
> >>>>          0x348 0xbb92
> >>>>              [ 3429.010907] fs/cifs/asn1.c: OID len =3D 7 oid =3D 0x=
1 0x2
> >>>>          0x348 0x1bb92
> >>>>              [ 3429.010910] fs/cifs/asn1.c: OID len =3D 10 oid =3D 0=
x1 0x3
> >>>>          0x6 0x1
> >>>>              [ 3429.010912] fs/cifs/smb2pdu.c: decoding 2 negotiate
> >>>>          contexts
> >>>>              [ 3429.010914] fs/cifs/smb2pdu.c: decode SMB3.11
> >>>>          encryption neg
> >>>>              context of len 4
> >>>>              [ 3429.010916] fs/cifs/smb2pdu.c: SMB311 cipher type:1
> >>>>              [ 3429.010921] fs/cifs/connect.c: Security Mode: 0x1
> >>>>          Capabilities:
> >>>>              0x300046 TimeAdjust: 0
> >>>>              [ 3429.010923] fs/cifs/smb2pdu.c: Session Setup
> >>>>              [ 3429.010926] fs/cifs/smb2pdu.c: sess setup type 5
> >>>>              [ 3429.010949] fs/cifs/cifs_spnego.c: key description =
=3D
> >>>>              ver=3D0x2;host=3Dfiler5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org>;ip4=3D10.1.123.38;sec=3Dkrb5;uid=
=3D0x0;creduid=3D0x3e8;user=3Droot;pid=3D0x1690
> >>>>              [ 3429.025053] CIFS VFS: \\filer5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org> Send error in SessSetup
> >>>>              =3D -126
> >>>>              [ 3429.025056] fs/cifs/connect.c: CIFS VFS: leaving
> >>>>          cifs_get_smb_ses
> >>>>              (xid =3D 13) rc =3D -126
> >>>>              [ 3429.025059] fs/cifs/connect.c: build_unc_path_to_roo=
t:
> >>>>              full_path=3D\\filer5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025059] fs/cifs/connect.c: build_unc_path_to_roo=
t:
> >>>>              full_path=3D\\filer5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025060] fs/cifs/connect.c: build_unc_path_to_roo=
t:
> >>>>              full_path=3D\\filer5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025062] fs/cifs/dfs_cache.c: __dfs_cache_find:
> >>>>          search path:
> >>>>              \filer5.arrlhq.org <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025063] fs/cifs/dfs_cache.c: get_dfs_referral: g=
et
> >>>>          an DFS
> >>>>              referral for \filer5.arrlhq.org
> >>>>          <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025065] fs/cifs/dfs_cache.c: dfs_cache_noreq_fin=
d:
> >>>>          path:
> >>>>              \filer5.arrlhq.org <http://filer5.arrlhq.org>\IT_Share
> >>>>              [ 3429.025071] fs/cifs/fscache.c:
> >>>>              cifs_fscache_release_client_cookie:
> >>>>              (0x000000006d2b3226/0x0000000090edec3a)
> >>>>              [ 3429.025076] fs/cifs/connect.c: CIFS VFS: leaving
> >>>>          mount_put_conns
> >>>>              (xid =3D 12) rc =3D 0
> >>>>              [ 3429.025077] CIFS VFS: cifs_mount failed w/return cod=
e =3D -2
> >>>>
> >>>>          journalctl:
> >>>>
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: key
> >>>>              description:
> >>>>              cifs.spnego;0;0;39010000;ver=3D0x2;host=3Dfiler5.arrlhq=
.org
> >>>>          <http://filer5.arrlhq.org>;ip4=3D10.1.123.38;sec=3Dkrb5;uid=
=3D0x0;creduid=3D0x3e8;user=3Droot;pid=3D0x1690
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: ver=3D2
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              host=3Dfiler5.arrlhq.org <http://filer5.arrlhq.org>
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: ip=3D10.1.123=
.38
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: sec=3D1
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: uid=3D0
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: creduid=3D100=
0
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: user=3Droot
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: pid=3D5776
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              get_cachename_from_process_env: pathname=3D/proc/5776/e=
nviron
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              get_existing_cc: default ccache is
> >>>>          KEYRING:persistent:1000:1000
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              handle_krb5_mech: getting service ticket for
> >>>>          filer5.arrlhq.org <http://filer5.arrlhq.org>
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              cifs_krb5_get_req: unable to get credentials for
> >>>>          filer5.arrlhq.org <http://filer5.arrlhq.org>
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]:
> >>>>              handle_krb5_mech: failed to obtain service ticket
> >>>>          (-1765328370)
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: Unable to
> >>>>              obtain service ticket
> >>>>              Jul 17 09:43:13 mkZ230.ARRLHQ.ORG
> >>>>          <http://mkZ230.ARRLHQ.ORG> cifs.upcall[5779]: Exit status
> >>>>              -1765328370
> >>>>
> >>>>          $ klist
> >>>>          Ticket cache: KEYRING:persistent:1000:1000
> >>>>          Default principal: mkeane@ARRLHQ.ORG <mailto:mkeane@ARRLHQ.=
ORG>
> >>>>
> >>>>          Valid starting       Expires              Service principal
> >>>>          07/17/2020 09:43:06  07/17/2020 19:43:06
> >>>>          krbtgt/ARRLHQ.ORG@ARRLHQ.ORG <mailto:ARRLHQ.ORG@ARRLHQ.ORG>
> >>>>                   renew until 07/24/2020 09:42:57
> >>>>
> >>>>          Filer5 is a QNAP TS-870U-RP Version 4.3.6.1070 (2019/09/10)
> >>>>          NAS device
> >>>>          but having this issue with other NAS device on LAN
> >>>>
> >>>>          --
> >>>>          Michael Keane, K1MK
> >>>>          IT Manager
> >>>>          ARRL, The National Association for Amateur Radio=E2=84=A2
> >>>>          225 Main Street, Newington, CT 06111-1494 USA
> >>>>          Telephone: (860) 594-0285
> >>>>          email: mkeane@arrl.org <mailto:mkeane@arrl.org>
> >>>>
> >>>      --
> >>>      Michael Keane, K1MK
> >>>      IT Manager
> >>>      ARRL, The National Association for Amateur Radio=E2=84=A2
> >>>      225 Main Street, Newington, CT 06111-1494 USA
> >>>      Telephone: (860) 594-0285
> >>>      email:mkeane@arrl.org  <mailto:mkeane@arrl.org>
> >>>
> >> --
> >> Michael Keane, K1MK
> >> IT Manager
> >> ARRL, The National Association for Amateur Radio=E2=84=A2
> >> 225 Main Street, Newington, CT 06111-1494 USA
> >> Telephone: (860) 594-0285
> >> email: mkeane@arrl.org
> >>
> >
>
> --
> Michael Keane, K1MK
> IT Manager
> ARRL, The National Association for Amateur Radio=E2=84=A2
> 225 Main Street, Newington, CT 06111-1494 USA
> Telephone: (860) 594-0285
> email: mkeane@arrl.org
>


--=20
Thanks,

Steve

