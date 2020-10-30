Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE329FBB6
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 03:50:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=L0i+R9d0Xun2nBuQXjtSokDESrURNKVNgwn3UB4f8O4=; b=B/aHS7ZWHY4B5OwOmgGg1l/W6W
	u60JtOQP+K+2UOVhNPFyD6F4/b86pK/8ZF030vu6cnvt8vK0CJZGxi0lBYobGLoFMrel6yZpLgJp/
	8AZ6F8GBhPJ6LqYgabdYsZxytl6ed1up00nB7dXxYoW0QIbGkJ4XwW3k8vY0h09rPV9I02UGiZbsA
	ioHyq2uSJMvPUX2QDtmrMjap6a9jBBdWANMHWXTJdVU+UyDbjx4448vl/uG7tWp9vWU1aVmw1dApa
	Xt5Oo7raWWJZffcUIpr5VQpjaDdkNZyj3WtTnxj5r+f1YdvvjqWrUGSpXLrqOZmdFM2pBsSB2ONPC
	VpX0ylAA==;
Received: from ip6-localhost ([::1]:40816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYKUX-00EXqB-Nc; Fri, 30 Oct 2020 02:50:13 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYKUR-00EXq2-45
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 02:50:09 +0000
Received: by mail-io1-xd34.google.com with SMTP id z17so6020734iog.11
 for <samba-technical@lists.samba.org>; Thu, 29 Oct 2020 19:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L0i+R9d0Xun2nBuQXjtSokDESrURNKVNgwn3UB4f8O4=;
 b=KuBlqxZsVk8qMQccsS5K4zQ9p2+w7gzOLAlGU7mHiExmuDceXeH2MRcpy0bGpHF34s
 +Vs7jwbY1KyuVTTg4fE5HKcNr+rtK4lE9lwW2B5g11SgZVpg1MmCcUjLFPqtV5sdaP2E
 HyzPnK/AVvxAaAM7tZWgQCQkYf0m9yHx2lN4TkB7fBvZKLwUYk9WaHvuN2bnPs1w/lBh
 RsG2uo80kM9gaLy50hsEl4rxGcXmE26nUOb+kRXuI9rGIdS6gvTHFBO3TJH5NBcSBQN1
 dNQvF46inq67Pq8NL6+190auc8rdD1E0JPBoT8EpVX3TG0NfqiBGZ6UNimfRbyLuHWZ/
 ETKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L0i+R9d0Xun2nBuQXjtSokDESrURNKVNgwn3UB4f8O4=;
 b=eicF4p1D82IT151NyKmdZC2HDpOKE1hJjUV6b7dnW4Vj3B4/5J/1nZEx0yXJ4P0Adj
 broYBtRU6/ag1zFRn2+oOODL/9VjemgLtOW6j34VgMHh716jRVPS5Ov66b4o3j27XvdL
 OlfTOESdLvLNyh7LgxTHhc4NnaZI92CTlb7TtVnS/bcF8syftf/Hj04Q+ydNsm1G9AP4
 NUY7k88uUJg2n4/g2kpr77Ycr1AXPYXM0OHyhhq7RCl/hbhToDP+CK+SnDT10jlE9DIW
 FsMOGPFtCKNwhro4T2zHmHvmugQLlinWpMLssO2amEd60egMZmlcsu1UcqR3y5Gx7iX7
 Luvg==
X-Gm-Message-State: AOAM5335gFOZtxjAdSZKdGtuGaC2s3/Jw/bocf1h9ctHg9ln8Pm98qyR
 bj1ThTnM6LpyY7lAIbF9mQkVtJOhT03RHvGxUk4=
X-Google-Smtp-Source: ABdhPJyZdl8bW75eIO6BdvpInFTMx+Hq1BnQuyGiZ9Ro/wtic83KfhnnnRH3q5j9b5SQzqjCkpSxiS+XVeOGxs4doz4=
X-Received: by 2002:a05:6602:22cf:: with SMTP id
 e15mr288947ioe.1.1604026203436; 
 Thu, 29 Oct 2020 19:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
In-Reply-To: <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
Date: Fri, 30 Oct 2020 12:49:52 +1000
Message-ID: <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
To: Xiaoli Feng <xifeng@redhat.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

What happens if you try to run it manually?

On Fri, Oct 30, 2020 at 12:32 PM Xiaoli Feng via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> After add NotifyAccess=all in Unit section. smbd still can't start.
>
> Oct 29 22:11:30 hp-dl360g9-12.rhts.eng.pek2.redhat.com systemd[1]: /usr/lib/systemd/system/smb.service:6: Unknown lvalue 'NotifyAccess' in section 'Unit'
>
> smb.services:
> # cat /usr/lib/systemd/system/smb.service
> [Unit]
> Description=Samba SMB Daemon
> Documentation=man:smbd(8) man:samba(7) man:smb.conf(5)
> Wants=network-online.target
> After=network.target network-online.target nmb.service winbind.service
> NotifyAccess=all
>
> [Service]
> Type=notify
> NotifyAccess=all
> PIDFile=/run/smbd.pid
> LimitNOFILE=16384
> EnvironmentFile=-/etc/sysconfig/samba
> ExecStart=/usr/local/samba/sbin/smbd --foreground --no-process-group $SMBDOPTIONS
> ExecReload=/bin/kill -HUP $MAINPID
> LimitCORE=infinity
> Environment=KRB5CCNAME=FILE:/run/samba/krb5cc_samba
>
> [Install]
> WantedBy=multi-user.target
>
>
>
> ----- Original Message -----
> > From: "L. van Belle" <belle@samba.org>
> > To: "Xiaoli Feng" <xifeng@redhat.com>
> > Cc: samba-technical@lists.samba.org
> > Sent: Friday, October 30, 2020 12:07:35 AM
> > Subject: RE: can't start smbd after install samba posix branch
> >
> > See: https://bugzilla.samba.org/show_bug.cgi?id=14552
> >
> > This might help, quick test is
> >
> > systemctl edit smbd
> > Add
> >
> > [Unit]
> > NotifyAccess=all
> >
> >
> > Greetz,
> >
> > Louis
> >
> >
> >
> > > -----Oorspronkelijk bericht-----
> > > Van: samba-technical
> > > [mailto:samba-technical-bounces@lists.samba.org] Namens
> > > Xiaoli Feng via samba-technical
> > > Verzonden: donderdag 29 oktober 2020 16:43
> > > Aan: samba-technical; CIFS
> > > CC: jra@samba.org; Ronnie Sahlberg
> > > Onderwerp: can't start smbd after install samba posix branch
> > >
> > > Hello folks,
> > >
> > > I try to install samba posix branch in RHEL8. But failed to
> > > start smbd daemon.
> > > Does anyone know the reason? or what else do I miss?
> > >
> > > #git clone git://git.samba.org/jra/samba
> > > #git check -b posix remotes/origin/master-smb2
> > > #./configure --prefix=/usr --enable-fhs
> > > #make -j6
> > > #make install
> > > #smbd -D
> > > # echo $?
> > > 1
> > > # smbd -D -d 10
> > > INFO: Current debug levels:
> > >   all: 10
> > >   tdb: 10
> > >   printdrivers: 10
> > >   lanman: 10
> > >   smb: 10
> > >   rpc_parse: 10
> > >   rpc_srv: 10
> > >   rpc_cli: 10
> > >   passdb: 10
> > >   sam: 10
> > >   auth: 10
> > >   winbind: 10
> > >   vfs: 10
> > >   idmap: 10
> > >   quota: 10
> > >   acls: 10
> > >   locking: 10
> > >   msdfs: 10
> > >   dmapi: 10
> > >   registry: 10
> > >   scavenger: 10
> > >   dns: 10
> > >   ldb: 10
> > >   tevent: 10
> > >   auth_audit: 10
> > >   auth_json_audit: 10
> > >   kerberos: 10
> > >   drs_repl: 10
> > >   smb2: 10
> > >   smb2_credits: 10
> > >   dsdb_audit: 10
> > >   dsdb_json_audit: 10
> > >   dsdb_password_audit: 10
> > >   dsdb_password_json_audit: 10
> > >   dsdb_transaction_audit: 10
> > >   dsdb_transaction_json_audit: 10
> > >   dsdb_group_audit: 10
> > >   dsdb_group_json_audit: 10
> > > [root@hp-dl360g9-12 ~]# echo $?
> > > 1
> > >
> > > I don't find any usefull log. Then I use systemd to start
> > > smbd services. Show this error:
> > > -- Unit smb.service has begun starting up.
> > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > systemd[1]: smb.service: Main process exited, code=exited,
> > > status=1/FAILURE
> > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > systemd[1]: smb.service: Failed with result 'exit-code'.
> > > -- Subject: Unit failed
> > > -- Defined-By: systemd
> > > -- Support: https://access.redhat.com/support
> > > --
> > > -- The unit smb.service has entered the 'failed' state with
> > > result 'exit-code'.
> > > Oct 29 11:36:47 hp-dl360g9-12.rhts.eng.pek2.redhat.com
> > > systemd[1]: Failed to start Samba SMB Daemon.
> > > -- Subject: Unit smb.service has failed
> > >
> > >
> > >
> > > Thanks.
> > >
> > >
> > >
> > >
> > >
> >
> >
>
>

