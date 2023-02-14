Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2D696E4F
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 21:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1hMk5YULVJv9rOa51/ZD8awYzYhGO2kdcm06DQJtxBI=; b=gSqpuwGCWOZP0KBdnJiBgkWn9b
	KDeiOUyPB+FuvlXTzIu0Gf0HmKMMgvzeAWBdOTSU1Vuq2aBSMW+/pidDMAiPB1HU6iZK/8RzSQOxr
	bC5lSKhdT+MbCE6tBsRT4+kXz3o+lO8y0WYtmKFOAJja8yH3lnj7xC8zOXmIra1eOsz6W6IXk3mWM
	TxV3RLYMeBurhKy2TDStlhORK1MlY56ssIt3UNufvUoAaB06ujBNf72la5BjA1JOs7eR0EPcUMPrW
	hVnkoF0J2GxkoMDOmts3cxz2I4R40fLSId9vUDTfdfdbrDkO9quvbrhMKv7uYGnloECtZBHR6BUXt
	e4zKM9FA==;
Received: from ip6-localhost ([::1]:53194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pS1gd-00CCDH-DD; Tue, 14 Feb 2023 20:13:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pS1gX-00CCD8-Rw
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 20:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=1hMk5YULVJv9rOa51/ZD8awYzYhGO2kdcm06DQJtxBI=; b=eulV/8GoCs1lizMAmnnvhbnaX1
 7wUnduXj9GhwBcsOuXNeMpCFb76Tnqlsps+kLP7Y3zZPoQyKwhz+T3Y0un3PGW0ItYUnkAfyaP9dC
 29vJ5cCVKddod0vrSEB58n0Vr/jv8wB8U+FinLnCXZUQCVCd6HTeeBENU8UW/MPDSaiURJxAjjPuu
 yXr+Ox++5xqHX2sO05uYN2BVSdJy2a2/RhBoGLK7MmFpB+16Xrt3AJYLAdgMETev8VbgNQjvp2s95
 c7nB0fgmCCJ6/m/N4nRiImCJfdtYQYbwIra7dGr0bOZ3e8y5Y1NoSNwmwkY0el8Qr37h8ur4ugXFT
 yVHHbiLulkBAKwBIBHlrcmqkTKBkqnsOBNj4ELQBWBJv++YOje2GiFo6IdlU6BFQjHJo7mmmlJeqm
 FXXRxfIGOJn47pudSR1/oSbxInxmbgYHcU9I+Ta1rB0mhNYsTJ2cg3GMCpETCSTUSTfazJVWyJoLb
 jEDoJAfbFdCgD01WI4E/MSgZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pS1gW-00Dit0-5t; Tue, 14 Feb 2023 20:13:52 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Date: Tue, 14 Feb 2023 21:13:51 +0100
Message-ID: <12155582.O9o76ZdvQC@magrathea>
In-Reply-To: <ca21f1f473a1a849cdef33bf7cd14e095be090c6.camel@samba.org>
References: <1944992.usQuhbGJ8B@magrathea> <2145228.Mh6RI2rZIc@magrathea>
 <ca21f1f473a1a849cdef33bf7cd14e095be090c6.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 14 February 2023 20:26:52 CET Andrew Bartlett wrote:
> On Tue, 2023-02-14 at 18:12 +0100, Andreas Schneider via samba-
> 
> technical wrote:
> > On Tuesday, 14 February 2023 16:39:59 CET Andreas Schneider via
> > samba-
> > 
> > technical wrote:
> > > Hi,
> > > 
> > > I've discovered on my Fedora 37 system that all tests related to
> > > domain
> > > backup fail. The strange thing is that I can't reliably reproduce
> > > it, I see
> > > reliably two different errors:
> > > 
> > > lib/ldb/ldb_key_value/ldb_kv_search.c:162: Invalid data for index
> > > DN=@INDEXLIST
> > > 
> > > or
> > > 
> > > lib/ldb/ldb_mdb/ldb_mdb.c:419: MDB corrupted for key [ DN=@OPTIONS]
> > > 
> > > ldb: Improve debug outout
> > > https://gitlab.com/samba-team/samba/-/merge_requests/2936
> > > 
> > > 
> > > It the tests worked just fine on my other system with openSUSE
> > > Tumbleweed.
> > > So I've tried to track it down. My home directory on openSUSE
> > > Tumbleweed is
> > > ext4 and on Fedora 37 my home is btrfs.
> > > 
> > > So I created a btrfs filesystem on Tumbleweed and could reproduce
> > > the issue.
> > > The next thing I did is replace the compression algorithm for the
> > > domain
> > > backup tarball to gzip and it also failed.
> > > 
> > > Now the question is if lmdb or btrfs needs a fix and how to create
> > > a minimal
> > > reproducer. As I never worked on this codepath, pointers and ideas
> > > would be
> > > really helpful!
> > 
> > I've did a quick hack and created the backup tarball (offlinebackupdc
> > env) on
> > ext4 and restored it on btrfs.
> > 
> > @@ -3426,11 +3426,12 @@ sub setup_offlinebackupdc
> > 
> >                                                     $dnsupdate_option
> > 
> > s);
> > 
> >         # create an offline backup of the 'backupfromdc' target
> > 
> > -       my $backupdir = File::Temp->newdir();
> > -       my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
> > -       my $backup_file = $self->create_backup($env, $dcvars,
> > -                                              $backupdir, $cmd);
> > +       my $backupdir = '/tmp/samba';
> > +       #my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
> > +       # my $backup_file = $self->create_backup($env, $dcvars,
> > +       #                                      $backupdir, $cmd);
> > 
> > +       my $backup_file = '/tmp/samba/samba-
> > backup-2023-02-14T16-14-17.289039.tar.bz2';
> > 
> >         unless($backup_file) {
> >         
> >                 return undef;
> >         
> >         }
> > 
> > Backup file successfully restored to /var/tmp/samba-test/samba/st/
> > offlinebackupdc
> > 
> > So the corruption could also happen when creating the tarball. I will
> > try to
> > checksum the file before backup put it into a file and store it into
> > the
> > tarball, then I can unpack it and check the sums.
> 
> Yikes, this certainly is a concern.  Having each file (or a rolling
> checksum over all the files as they are added) checksummed or such
> would be a useful feature.
> 
> All the best chasing this down.

I think I found it:

The issue is the lmdb mdb_copy command on btrfs



     def offline_mdb_copy(self, path):
+        mdb_chksum = create_file_checksum(path)
         mdb_copy(path, path + self.backup_ext)
+        mdb_copy_chksum = create_file_checksum(path + self.backup_ext)
+        if mdb_chksum != mdb_copy_chksum:
+            raise CommandError("FATAL: MDB checksums don't match!")


This triggers on btrfs and works on ext4!


I will prepare a reproducer tomorrow.


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



