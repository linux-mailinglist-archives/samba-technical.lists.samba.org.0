Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D068C6AA
	for <lists+samba-technical@lfdr.de>; Mon,  6 Feb 2023 20:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VkCQ+G20+rrGE5Z+lUfczk4bSWBdeewT0P1PgdGfeO4=; b=DukWekE+SrGejjlbXtEfgrxrII
	tzBNUfwGaNUKFl8r2cPy8mrewgiUdKYmZCT8tOVjRAcUBnAdRiFM35BPwIuo2DcvW2rpdgEueWNrn
	feJQt2nt3yNyjYYaojhYOBxDHi669OIZWRJdCz0BsWLsbtMYa/A0m9AmLpgqZ9YVLqFAxX+/+wvLv
	3exWV8usNZniKFJX/vyYprSRsj5eWN9a+hsVSb37n7/08v3wkRDu/XQXUuBwQmKFzGcSUJKYgcXTc
	rw4DZtXi6ZteJx3+nrWBYBjSOB8HwiUPzhPwTQGAw6xAgXnKdsnwOvZ2INQFGYJS/yfwvNrGBF6bD
	MHbM6b2Q==;
Received: from ip6-localhost ([::1]:33504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pP725-0091JA-SF; Mon, 06 Feb 2023 19:20:05 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:40669) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pP720-0091IP-8y
 for samba-technical@lists.samba.org; Mon, 06 Feb 2023 19:20:02 +0000
Received: by mail-qv1-xf34.google.com with SMTP id w11so2297655qvs.7
 for <samba-technical@lists.samba.org>; Mon, 06 Feb 2023 11:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hewVPSZPciH8SW85jrhxwOllLkRPP3NL3ZhtAdx5EQU=;
 b=NT9mB/idNt4EiYLh5PT4/NuYCSi+vNw1ea7f7WsWsVNL1g9c/L1ukmhg9Y/TSZOb8k
 e1JykJ3HE+7r6yHYX+lDr/ri0dOj/3ygWnHbSIVoALJJUnHZuAvBEXfnDRIUiI4C6bvr
 avitggUTIlMxsin7k1c6mARNnSfrsrQyG2I9Gt87x8uwU+CvuRGZiF3oez14lZc+eXv8
 v5gmr5cAaE1TXaMMyS1WeaPxzxW9TuK0fvMg9JGvIc6gy/j2vQN5Ehzik6Y1ksTYYQ03
 lnL4AX7Qm7nhLTPOjwZmSed5Sy0iGkamG6rTvWEec4976rffQM8rjJfPuAihkWyg5CWL
 hlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hewVPSZPciH8SW85jrhxwOllLkRPP3NL3ZhtAdx5EQU=;
 b=0d1rfOicRMwk2FAnzQ4R11pMGZv/1yanTWMqwh+y7PzotaFkF7SXMlV7pfu/D+5GGn
 9rlx1XxH0ANAJrag3SOoO/HVKD3mdLyZMMaSjIdYBs3LG6tuus6+JjKCgWAibM2BXsSt
 uMRJt5liWPKSQrCa5NTSuS6solYTvpXgwZ9CAQGp58vCRaUC/u28lXYW7NjzXgRFl9yW
 +jxysHSDiwdn2Htb1cSKpTMouMctJvnN1KzNgyAZdSkS/Ny3YrxuNcNuO/rjpwSxR1bN
 4iReEA3L3vN19QQa6spHUsF1v65gSwbhHL7O85gbWB7XqLZkrAOCV4vODNVkS3XUCLZJ
 5Fpg==
X-Gm-Message-State: AO0yUKUkmEmWslkuvqqaMtAWBkw1RpBE5zwMKOp3qc0tGrt81MZRfjt5
 kuQg+gdaoAhAvQUYPXr3dAHEINS31MZzaoLwBUc=
X-Google-Smtp-Source: AK7set9i6IcYsVZY+jhWY/QeKQv7hyckjUaDpDHIZf41Vd7s49FM3Vsu4HDkBoXHNh8ff0EBiq0UzLdvgLIwHjhDiJ0=
X-Received: by 2002:a0c:da90:0:b0:56b:f5d6:5c02 with SMTP id
 z16-20020a0cda90000000b0056bf5d65c02mr10041qvj.27.1675711197996; Mon, 06 Feb
 2023 11:19:57 -0800 (PST)
MIME-Version: 1.0
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
 <Y91JdhAtd41n9C7O@jeremy-acer>
 <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
 <CA+RDaRAUAhjM9CDuJz13HKt9GcbDhMR-HW3YPTpWuMGPLQU-FQ@mail.gmail.com>
 <a395da31-5812-9fb8-6857-7da0bf1b8531@talpey.com>
 <CA+RDaRDGLQya8TzsUrBDR4vV28HcoxsEaJSE9_r9bn_Rc=f9BA@mail.gmail.com>
 <d59214c5-6917-94ca-0608-1832d8de916a@talpey.com>
In-Reply-To: <d59214c5-6917-94ca-0608-1832d8de916a@talpey.com>
Date: Tue, 7 Feb 2023 00:49:41 +0530
Message-ID: <CA+RDaRAhOz6h3K0H_WuMC+AOuywBtBuGtwgnm7AbkiEJpNGUnQ@mail.gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I observe the same behavior with my Win10 client and Samba server with
streams_xattr.

The /COPY:DATX didn't change the behavior for the directory, but /DCOPY:X
does as I had
mentioned in my earlier comments.
And not sure why, but only /DCOPY:X does, if I specify any other flag like
/DCOPY:DAX, it doesn't :)


On Mon, Feb 6, 2023 at 11:24 PM Tom Talpey <tom@talpey.com> wrote:

> Aha - ok, if Windows-to-Windows is broken, it's in robocopy.
> Interestingly, I can't repro this from my Win11 system to
> a Samba server with streams_xattr loaded.
>
> Yes, I'm aware it's the directory create that fails.
>
> Maybe one other thing to test. What if you add the "X" copyflag,
> which turns off copying streams? Perhaps your robocopy.exe will
> ignore the filesystem stream attribute and use FILE_OPEN like usual.
> It's purely an academic exercise though.
>
> robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
> <file-name> /COPY:DATX /R:1 /W:10
>
>
>
> On 2/5/2023 11:44 AM, varun mittal wrote:
> > Hi Tom
> >
> > I did test it with Windows share too and the behavior was the same.
> > But please note, the FILE_OPEN_IF I am chasing is for the Directory
> > and not the files.
> > In my case, the source directory doesn't have any named data stream.
> > The files in the source directory also didn't have any ADS. These files
> were
> > generated locally.
> >
> > On Sat, Feb 4, 2023 at 7:38 PM Tom Talpey <tom@talpey.com
> > <mailto:tom@talpey.com>> wrote:
> >
> >     This is worth figuring out.
> >
> >     Because it's a file in your Downloads folder, it was probably
> >     created by a browser. This means it has an additional stream
> >     which indicates it's from the internet. Defender and other
> >     tools use the presence of that stream to throw the "Do you
> >     really want to open this file?" dialogs.
> >
> >     When you copy the file to a non-stream filesystem, that stream
> >     is obviously lost, in which case robocopy is not going to do
> >     anything special. But when copying to a filesystem that does,
> >     it will take a different path, copying everything. Or maybe it's
> >     the fact that it's in the Downloads folder, and robocopy is
> >     being clever. Or just a bug in the Win10 robocopy you mentioned
> >     you're using.
> >
> >     Would you happen to have a Windows system with an NTFS share
> >     that you could robocopy the same file to, and grab a trace?
> >
> >     It would give us the breadcrumbs to figure out what's missing.
> >     Maybe there's some other volume or filesystem attribute that's
> >     missing, and confusing robocopy.
> >
> >     Tom.
> >
> >     On 2/4/2023 3:17 AM, varun mittal wrote:
> >      > Nothing fancy, simple copy command:
> >      > robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
> >      > <file-name> /COPY:DAT /R:1 /W:10
> >      >
> >      > On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com
> >     <mailto:tom@talpey.com>
> >      > <mailto:tom@talpey.com <mailto:tom@talpey.com>>> wrote:
> >      >
> >      >     On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical
> wrote:
> >      >      > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal
> wrote:
> >      >      >>   I was able to narrow it down to the "Named Streams" bit
> in
> >      >      >>   "FileFSAttributeInformation" response.
> >      >      >>   When this value is toggled from 0 to 1, as is
> advertised by
> >      >      >>   `streams_xattr` VFS module, Robocopy
> >      >      >>   switched from FILE_OPEN to FILE_OPEN_IF.
> >      >      >>   Thanks
> >      >      >
> >      >      > Thanks for tracking that down. What strange behavior.
> >      >      > I can't see why having a stream would make the open
> >      >      > change to optionally creating the file, but it's good
> >      >      > info to know. Thanks for posting the follow-up to
> >      >      > the list !
> >      >
> >      >     It's not the presence af a stream, it's that the fileystem
> >     supports
> >      >     named streams. It's getting that from a
> >     FileFsAttributeInformation
> >      >     on the root directory.
> >      >
> >      >     Robocopy has a very broad range of OS- and FS-dependent
> behaviors
> >      >     and optimizations. I bet there's some combination of its
> 1000-odd
> >      >     commandline options that can change this.
> >      >
> >      >     Varun, what exact robocopy command are you seeing this from?
> >      >
> >      >     Tom.
> >      >
> >
>
