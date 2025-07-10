Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 751EEAFF7E1
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 06:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8bCtkpW+iq79PPcECpcYI0zfM6pAKFYYwYNRsdMC30Q=; b=1qNHZjgWU6Zt5Jgs3qHxhHIMy2
	sI7hRnYcOON5wMt2HkYEk3XhBiz/B4/FtwoM+G5T7OoAfLZZuY7/2DiBxSEuoRBuExdbryOZLbkPH
	4wnJMSLI6NHeXjOGOE4JMWY4/0PARYxt71+dyxrNxD4sjAcAdv6QgSCWXAKV2Oq/bgk3h0ZpVlgPz
	rQk2+YKX/m13dpKVnr3nOnB018JKOi3W+EnkefDVDs4dLDqcYo2+7kQsPYb+HtM7WmZ98+3AiwMjE
	EgERjTf8vqQdGH2LiJQg360h/8CuwbnWmiIymKw9ZUlWX3H4EbkNEgksHYAga1+I/XaUjKkIKq6Nq
	iZkSHGEg==;
Received: from ip6-localhost ([::1]:26788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZij8-00AuZx-HX; Thu, 10 Jul 2025 04:17:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:53510) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZij0-00AuZq-1F
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 04:17:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4a44b0ed780so6685311cf.3
 for <samba-technical@lists.samba.org>; Wed, 09 Jul 2025 21:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752121052; x=1752725852; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8bCtkpW+iq79PPcECpcYI0zfM6pAKFYYwYNRsdMC30Q=;
 b=Aag0eMndmwLFpGw4T0r5dcXsWu2y3PYrQ21zH2mfYHE68LwlmvWFDe7G8KAvH5K+2p
 ocx7hYSSY8KRH/kj0uKLF1VXHrEeAD0FCErljA2jOC1C5GEjj/7Qihpkac3s4LDzjsGG
 YkUjbXfvJZmoJsb5ENf2oaeVwAk6K76SEQw87p6IEooRDUjKg/EH6yYVO55T0MWaW7lz
 IHpHJbcsteepM1quzts/CKpLP6eAzsHzMf2Df8vRV73qr4omx+YfCGsthFNRMlhAbFiO
 hK0QbNzOXf6+zrMVkdTQaZTZKfav46qUsjmGZe6NKgDJQgKPacmjKi4guAFdzjL6mxG0
 m4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752121052; x=1752725852;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8bCtkpW+iq79PPcECpcYI0zfM6pAKFYYwYNRsdMC30Q=;
 b=nZzXT2DER/9NGzIJ7KTiZWutBQK2+92Mma2o98nJh1gQUpuuc/I8uzYgTdE3gnJKzm
 KZiCi0E2723ADarGQLBw39KRryvoZuXnyqoYTdmgwMszNBVFgLrKYhlSLScUu44xHcTL
 Wfsm2zAHBHQ5XLYNfeILCLKYJtRsQbBFyfMDjnxKAA6Wm3GwyufxCZxX6SdpAnmw2nQS
 cWr3FsnBsra9Ge7JyhdnWaSNM/+xbfye+wUeQTiNrmt3Ia8thgUIKhPsbqd3Udd0fD2v
 zecmHk1W5RXkT2ybTbKQBgSAZ41tzKLNWGL4SO4BQ3EoO4Q8y8KXc9z6XBwHTToDw33F
 k92w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3/PeYoexfR+veCPzlq2z44ouen51XHFyJU9onwPe6pSrWzElxQqRxwXtIA17ImUDjvv9p29JHlKIwcU0cTyQ=@lists.samba.org
X-Gm-Message-State: AOJu0YzcSLiwV/ynMbH/wYIED9AFQa7vYgsEjCPyhTC6p7xM6Yx7VVdD
 zoIlxcgyB3EKLMsmZx76qaGqT9VA6AVuArDZyI3bnH+5ZtB8kOY2aDoNGFY+ggv+kQojVJKdkAy
 yq06BT1QNBkGbmVlYPEZEwKH5M1gkWSE=
X-Gm-Gg: ASbGncvcuOj5csv6w87T3V55ZxZDJl5kkfDbLJFla8Al8UhC9y8iRW9jquMtOkW6PCB
 BPs+Rxy8kSKpguD4uZkU+iz8DpnLvZ5rJHmUulnHePp+FJ5sSDzwArDeswt1XSWHVwAs7+NAwgW
 AvuNthmY4PvtVmNy1Dr3g8+o3dia9aVJ2dZ6MHqCwV8hAb34ZXRJoSPmOw57J7PSxteDFLjq35W
 vmoSQsUuqPWx+8=
X-Google-Smtp-Source: AGHT+IFNFzV4xwnvdI/o6DEIOt5bGXzLum1q0WMR0we2wqWqz+wzD24rk+rWBaiwfcHV76jkOe/UaQwmIZGnTzDmuKA=
X-Received: by 2002:a05:620a:1a81:b0:7d3:8dc9:f438 with SMTP id
 af79cd13be357-7dc92c84c2amr316563485a.17.1752121051663; Wed, 09 Jul 2025
 21:17:31 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 Jul 2025 23:17:20 -0500
X-Gm-Features: Ac12FXzd95UuYiaKQXt7Zf3mDVwLbHSfIvMggnvdcSLPbLWHoNEQ09TkItvxWGo
Message-ID: <CAH2r5mvKXfktSaikDTAspOTvOitpP0BDL6+GdVvptjSsKoZUNg@mail.gmail.com>
Subject: directory lease bug where newly created files are ignored till lease
 times out
To: Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Henrique Carvalho <henrique.carvalho@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Shyam Prasad <nspmangalore@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did some additional experiments with the scenarios we were
discussing (eg.  "ls /mnt/ ; touch /mnt/newfile ; ls /mnt") and
although your fix addresses the problem it seems more performance
regressive than needed.   A smaller version of it that I tried worked
fine.   See below (removes the apparently unneededd
"close_cached_dir")

diff --git a/fs/smb/client/dir.c b/fs/smb/client/dir.c
index 1c6e5389c51f..fc5a2d7ec4f6 100644
--- a/fs/smb/client/dir.c
+++ b/fs/smb/client/dir.c
@@ -190,6 +190,7 @@ static int cifs_do_create(struct inode *inode,
struct dentry *direntry, unsigned
        int disposition;
        struct TCP_Server_Info *server = tcon->ses->server;
        struct cifs_open_parms oparms;
+       struct cached_fid *parent_cfid = NULL;
        int rdwr_for_fscache = 0;
        __le32 lease_flags = 0;

@@ -313,10 +314,10 @@ static int cifs_do_create(struct inode *inode,
struct dentry *direntry, unsigned
        if (!tcon->unix_ext && (mode & S_IWUGO) == 0)
                create_options |= CREATE_OPTION_READONLY;

+
 retry_open:
        if (tcon->cfids && direntry->d_parent && server->dialect >=
SMB30_PROT_ID) {
-               struct cached_fid *parent_cfid;
-
+               parent_cfid = NULL;
                spin_lock(&tcon->cfids->cfid_list_lock);
                list_for_each_entry(parent_cfid, &tcon->cfids->entries, entry) {
                        if (parent_cfid->dentry == direntry->d_parent) {
@@ -327,6 +328,7 @@ static int cifs_do_create(struct inode *inode,
struct dentry *direntry, unsigned
                                        memcpy(fid->parent_lease_key,
                                               parent_cfid->fid.lease_key,
                                               SMB2_LEASE_KEY_SIZE);
+                                       parent_cfid->dirents.is_valid = false;
                                }
                                break;
                        }
@@ -355,6 +357,10 @@ static int cifs_do_create(struct inode *inode,
struct dentry *direntry, unsigned
                }
                goto out;
        }
+
+       /* if (parent_cfid && !parent_cfid->dirents.is_valid)
+               close_cached_dir(parent_cfid); */
+
        if (rdwr_for_fscache == 2)
                cifs_invalidate_cache(inode, FSCACHE_INVAL_DIO_WRITE);


I also noticed that this does relate to an xfstest (that should have
caught it if we were running) generic/637 which seems to test exactly
this scenario.  I will add generic/637 to our regression test
('buildbot', and have already added it for tests to Samba since it now
has dir lease support) so we won't miss regressions like this in the
future.

Also another unrelated thing I noticed, probably server bug in Samba,
was that the scenario   "ls /mnt ; (go to server) create file1 ; (go
back to client) "ls /mnt"   was also not showing the new file (and
clearly should have) due to Samba server not sending a lease break on
local file creation - so Samba server has a directory lease bug (not
hanging an inotify on the directory to note new files being added
locally).



-- 
Thanks,

Steve

