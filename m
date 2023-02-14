Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD041696E2E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 20:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PYbC9WWM2OeGggpc4Q+mcgNKq6Z99bb7cLhHA8xBSig=; b=ZvPPllrg2xVvlZYmNDXaXTF7cs
	1M1EkOEVKwScC1SYEzWXuEihuaPTivU+earJ2LJ839lUsDISyyCfXGo6cE6v8o70Q3dOPeg/JjuhQ
	jhsva9AybP5O6O39sMajhnVF0+lRaJf7GJYa9hmHtD1FBLOMgVjT6ZmNrH2y+s4SgPTo4EEdP+JR4
	dwTdLPK1JYVeZHKDsUoNCWRGf7GHBpP7ugP3D89Bp380DHt39N2jmuqEkstFSZ5p4rTQQG/TpRQyr
	PxFM7khDaiuQDLFFl0r89gieZWWLKqYjr3AA4f86DFwPX2D+EkCkzod0JO1q8LIqXAe1oOyWMBS4U
	UrYvblBA==;
Received: from ip6-localhost ([::1]:49378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pS1Ok-00CBr3-Og; Tue, 14 Feb 2023 19:55:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pS1Of-00CBqu-EZ
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 19:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=PYbC9WWM2OeGggpc4Q+mcgNKq6Z99bb7cLhHA8xBSig=; b=X9mS1Z3WTdGn8jkyeFPHLdKObM
 Z1/1Zy4Zyn/ed8/nv6gGT7/lMd3rYMnxUTkz5fA+EauMie4Npd2OMXD9daR7q1G8ZcADM6ZlwGU8+
 42jsVKTBFdvwb1oKEmHzbCeZNb5TOm2TKkqKtzZ3Wy5gTSWyZ9kWJ/gyKOXlhs4r3hfNn/mqAP4Gn
 CVWrDMxxuMn7QDJG7KqnUrt5VaT3CapX8eSjFTew8kIK+RrDrDMqmW7nwesrx1UOTqe0OYYtEh+MK
 KgdCjFQPODexbvipCO11x1jL3+kMF1qK3qxvUgHainvbWaHT7B6Aeyxnkdelpz/XDT1XjbcqGK6Um
 6PvXnSfplbG9fwV1pKnTuI+KRYfaervbeBwMbsyktjnuSRRN0lbSdJwWKjDf3kjeXGSTel4yLMS0H
 xQInKp3wkgWKzwuIMPZuLAVCJeL4Wo8kRO32Psjp7GIuHizc+QJAf94Qkm70ou3xRWaZKtsead3M1
 LPlJW58K6VVH/I38puZAu4J6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pS1Od-00DimA-Tk; Tue, 14 Feb 2023 19:55:24 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Date: Tue, 14 Feb 2023 20:55:23 +0100
Message-ID: <45315200.fMDQidcC6G@magrathea>
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

I created a checkum before they added to the tarball now. After unpacking the 
checksums still match.

Now I wonder if mdb_copy might be the problem.

> All the best chasing this down.

Thanks


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



