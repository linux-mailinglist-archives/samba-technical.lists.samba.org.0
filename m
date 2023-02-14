Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DC696DE8
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 20:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=muxIMY3R1OapDvHvkqEFGmuFQlJKcvxnD27FvluIMkY=; b=TqT/lRjjohajEEbbsJN2ZSMJvV
	nHuoN/pJUYiHkOVUHyW2lvgJNfoWDea61BAUeaqfM+CSlf35hx8FvCT35M1rEcSktlW2vNy+Ehpjg
	98YOwGJpi1kk4G4XqYi/1L7TbDh/RKMvNWQiBNd1dpgMoe1ndlBw9gm84ljtvA9JYMzLdCO2B9dCg
	xw5uONYPOOBQKyKaHqDskkT4ImKD5tReCbpMO0/UOPrvsZ8BY9Hx5M1KEKxpx7AejtRRukr+ZDiwc
	c43FAiS89lnx//3GeVq+4C+BKcBDaX0IhDUkC8w+fjCL978jLEO0lIyFOsO0xCeqRFfQzvgVfPqrj
	JlCmd1jg==;
Received: from ip6-localhost ([::1]:19992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pS0xE-00CBWN-Ui; Tue, 14 Feb 2023 19:27:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pS0x8-00CBWE-EK
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 19:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=muxIMY3R1OapDvHvkqEFGmuFQlJKcvxnD27FvluIMkY=; b=CeWBGuovus26XLf/dO33K+Pa4v
 KnWXW2G9Turm+RJsTiH0+9w4ojnxj4I5Z1qHs4H9xFTY0hMJsxJvl42lvyyyEQgWKZv3+sTwTu3jT
 DUrkbUpG2E8YqlT1/5rrN7s1PAGm8u81d85HkbEwopji3zCftbZSF/2cvCi3PBcYnvTBnJ0g7vzNo
 gmJ2F/OPX33lyYySSPOb/zXasFz0L8zP5du+6rCe+gXs2hNX15FXJJZZIUA+juGdk/y4bgcw/ujuJ
 +oyuT8wKmAaQc686/Z7ssYf7CQu+kq4THWGjXrXOpbc4Fk3nGPB3iwbfrQn3zp8+P9xJz8P8XctmA
 2eHpH6LLXtMuhFFNMyC4s81fMJzv4/vdw5KA1cHy7tw1sWyQ5ARjhFoJsHrThg9EUTatjJWP8ctlv
 leBGXHIHCmKjjQdKmivn5y8l6aMdg5HEiZ11gKmR1ClSTFjlcfTFqYFcIHapnwZZ1yNsSLY9rNh21
 bImFWWlOGTR+SOvoYjjEZXpp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pS0x6-00DiWO-Lc; Tue, 14 Feb 2023 19:26:57 +0000
Message-ID: <ca21f1f473a1a849cdef33bf7cd14e095be090c6.camel@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 15 Feb 2023 08:26:52 +1300
In-Reply-To: <2145228.Mh6RI2rZIc@magrathea>
References: <1944992.usQuhbGJ8B@magrathea> <2145228.Mh6RI2rZIc@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2023-02-14 at 18:12 +0100, Andreas Schneider via samba-
technical wrote:
> On Tuesday, 14 February 2023 16:39:59 CET Andreas Schneider via
> samba-
> technical wrote:
> > Hi,
> > 
> > I've discovered on my Fedora 37 system that all tests related to
> > domain
> > backup fail. The strange thing is that I can't reliably reproduce
> > it, I see
> > reliably two different errors:
> > 
> > lib/ldb/ldb_key_value/ldb_kv_search.c:162: Invalid data for index
> > DN=@INDEXLIST
> > 
> > or
> > 
> > lib/ldb/ldb_mdb/ldb_mdb.c:419: MDB corrupted for key [ DN=@OPTIONS]
> > 
> > ldb: Improve debug outout
> > https://gitlab.com/samba-team/samba/-/merge_requests/2936
> > 
> > 
> > It the tests worked just fine on my other system with openSUSE
> > Tumbleweed.
> > So I've tried to track it down. My home directory on openSUSE
> > Tumbleweed is
> > ext4 and on Fedora 37 my home is btrfs.
> > 
> > So I created a btrfs filesystem on Tumbleweed and could reproduce
> > the issue.
> > The next thing I did is replace the compression algorithm for the
> > domain
> > backup tarball to gzip and it also failed.
> > 
> > Now the question is if lmdb or btrfs needs a fix and how to create
> > a minimal
> > reproducer. As I never worked on this codepath, pointers and ideas
> > would be
> > really helpful!
> 
> I've did a quick hack and created the backup tarball (offlinebackupdc
> env) on 
> ext4 and restored it on btrfs.
> 
> @@ -3426,11 +3426,12 @@ sub setup_offlinebackupdc
>                                                     $dnsupdate_option
> s);
>  
>         # create an offline backup of the 'backupfromdc' target
> -       my $backupdir = File::Temp->newdir();
> -       my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
> -       my $backup_file = $self->create_backup($env, $dcvars,
> -                                              $backupdir, $cmd);
> +       my $backupdir = '/tmp/samba';
> +       #my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
> +       # my $backup_file = $self->create_backup($env, $dcvars,
> +       #                                      $backupdir, $cmd);
>  
> +       my $backup_file = '/tmp/samba/samba-
> backup-2023-02-14T16-14-17.289039.tar.bz2';
>         unless($backup_file) {
>                 return undef;
>         }
> 
> Backup file successfully restored to /var/tmp/samba-test/samba/st/
> offlinebackupdc
> 
> So the corruption could also happen when creating the tarball. I will
> try to 
> checksum the file before backup put it into a file and store it into
> the 
> tarball, then I can unpack it and check the sums.
> 

Yikes, this certainly is a concern.  Having each file (or a rolling
checksum over all the files as they are added) checksummed or such
would be a useful feature.

All the best chasing this down.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst.Net Limited

Catalyst.Net Ltd - a Catalyst IT group company - Expert Open Source
Solutions



