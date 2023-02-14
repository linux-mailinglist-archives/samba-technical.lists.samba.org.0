Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96890696AF7
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 18:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8kkYdgtcYKbgXShpE5YD2j0O9BUwWesTkMEXe5HMtKs=; b=5rI5m/W8dTcmXiNJLVVx3rE06e
	KUnQ6GR6Dv+iK8fDD7Sqd9REWD4Y3aKrTmK/mKIG+z5MZ179KkDAdmpx82eNZCl2LUgt1nYlGTnQ2
	bYw2/277lZ+Ov5DgK19mt2SqXr+DJ1lFT5AVfIMGFR2bhZTgWXaMYnh3dW3M9AJDhZ+kBbbEFhX2i
	AL5p85GbetbWzc4wL2cs0nqL/fTlEUeMBMcbMU0ywy1dd3PilN2lZFv8CARbxJhvSWDQDUDi7x09c
	JVf1ZzugmZjmXRgGgjPoDgwAptNfYxIO/DI4qkWHTeSv8elY3xyoXT+B6m1VOSOOqds61bgE+yFHt
	oGumDvkw==;
Received: from ip6-localhost ([::1]:29606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRyqi-00C9Hm-Tx; Tue, 14 Feb 2023 17:12:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRyqc-00C9Hd-Sy
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 17:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8kkYdgtcYKbgXShpE5YD2j0O9BUwWesTkMEXe5HMtKs=; b=KEktjlXkWpY+6oScEzjaW34Qby
 VEcGh9qY5qMGvff2kN9KtPN4DCnUDRdVqc9o6pJm7TBQMEkobkqFqtjN8s7YcM+wgZ8DTYdKeslUh
 cZIuQ9lnjaC0Q/1xIFiAqP3FFQzQJdD9iwSH+ZC4A94mv8ZuJZBqXRzJSTeVcogmuqm6U3z2Sqe+W
 CE2QkrvzTxo6QuSibq+eoPIuhUIAr/AiLmQ/3xfHvkSNBPlYiLPjrr+xsgcTB30t1of/0zSiJIhMX
 986k/TWsraxTI4DyUlSyUcgdeRZEuOSDcY9OQGpGJDCZ9sF5gRgcd7YMU+yBbK9DfGNALOcoyebI8
 yzStRC+Cxw/gw3Ou2GBwDxfisFV+YUcDsBZzvKleD5w/NCR/HiLPId6vu0xSldJz7OG+mBynPaSgJ
 CyN/TDmi577ZfLStXwultQpEosQn6MQhb+Plbh6B4hBv6LCUt9Yy5vj3ODSDa96OpVhG0TGUjmNDM
 H1z/DTgsPKd8RDWu8yl+WkuR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pRyqb-00DhDK-Ru; Tue, 14 Feb 2023 17:12:05 +0000
To: samba-technical@lists.samba.org
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Date: Tue, 14 Feb 2023 18:12:05 +0100
Message-ID: <2145228.Mh6RI2rZIc@magrathea>
In-Reply-To: <1944992.usQuhbGJ8B@magrathea>
References: <1944992.usQuhbGJ8B@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 14 February 2023 16:39:59 CET Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> I've discovered on my Fedora 37 system that all tests related to domain
> backup fail. The strange thing is that I can't reliably reproduce it, I see
> reliably two different errors:
> 
> lib/ldb/ldb_key_value/ldb_kv_search.c:162: Invalid data for index
> DN=@INDEXLIST
> 
> or
> 
> lib/ldb/ldb_mdb/ldb_mdb.c:419: MDB corrupted for key [ DN=@OPTIONS]
> 
> ldb: Improve debug outout
> https://gitlab.com/samba-team/samba/-/merge_requests/2936
> 
> It the tests worked just fine on my other system with openSUSE Tumbleweed.
> So I've tried to track it down. My home directory on openSUSE Tumbleweed is
> ext4 and on Fedora 37 my home is btrfs.
> 
> So I created a btrfs filesystem on Tumbleweed and could reproduce the issue.
> The next thing I did is replace the compression algorithm for the domain
> backup tarball to gzip and it also failed.
> 
> Now the question is if lmdb or btrfs needs a fix and how to create a minimal
> reproducer. As I never worked on this codepath, pointers and ideas would be
> really helpful!

I've did a quick hack and created the backup tarball (offlinebackupdc env) on 
ext4 and restored it on btrfs.

@@ -3426,11 +3426,12 @@ sub setup_offlinebackupdc
                                                    $dnsupdate_options);
 
        # create an offline backup of the 'backupfromdc' target
-       my $backupdir = File::Temp->newdir();
-       my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
-       my $backup_file = $self->create_backup($env, $dcvars,
-                                              $backupdir, $cmd);
+       my $backupdir = '/tmp/samba';
+       #my $cmd = "offline --configfile $dcvars->{SERVERCONFFILE}";
+       # my $backup_file = $self->create_backup($env, $dcvars,
+       #                                      $backupdir, $cmd);
 
+       my $backup_file = '/tmp/samba/samba-
backup-2023-02-14T16-14-17.289039.tar.bz2';
        unless($backup_file) {
                return undef;
        }

Backup file successfully restored to /var/tmp/samba-test/samba/st/
offlinebackupdc

So the corruption could also happen when creating the tarball. I will try to 
checksum the file before backup put it into a file and store it into the 
tarball, then I can unpack it and check the sums.


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



