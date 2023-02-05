Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B168B105
	for <lists+samba-technical@lfdr.de>; Sun,  5 Feb 2023 17:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G8Lym0RnnYM6Yivt9Y9c+HvIRxVO2H/z78Mikvl2ZCI=; b=QjrrOhKFK5EGU5nrW66rHZAF9f
	aJAQiHbLUsttDL2BwDqCdM0Quh19rAwL6dmoR4miIycuAqRbjteLf6S/Yy2bb71C9/c3RpF/AIWFU
	kJTmhLFBlCgJQugqDlq+eJUxuoQuTpH/hebUMy3yuaC2X24EGr4yuRYgMcFsTk++WcyuI8/a3bnaP
	FIAj6VW1oyMgOWKF26oI621xA01nnsn8eauivo3EFP5aeprqxTfAQjVf/8UcOe5/O1krVQoqVSKKE
	7DzlTVbhfYMvpBzGklibxFr87Ji1pZX0SCzwB/vy0CsR5UJjKEr1vfQzD0xRtyjXE7cUSiQETdLGp
	/IrYZ4Rg==;
Received: from ip6-localhost ([::1]:26342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pOi8o-008uX1-Ud; Sun, 05 Feb 2023 16:45:23 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:33434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pOi8h-008uWs-ON
 for samba-technical@lists.samba.org; Sun, 05 Feb 2023 16:45:19 +0000
Received: by mail-qt1-x82b.google.com with SMTP id h24so10601488qtr.0
 for <samba-technical@lists.samba.org>; Sun, 05 Feb 2023 08:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S1nNaT/PuaWLISehoqPixkzlXUj9kC9NZ6EI9OYHXpo=;
 b=SwR0FU9N6DI/Yu0K/bhOjL1K3pB1Xwxda7gc1AhRrcomhT+sgTrv72r5S7zj9j5DBz
 2c1fT7Ibz34K0+RvcUdgqm0IimmeHf6tCrlB+3FMLGWM+0NM8hBV79gLVp0y+O2AO1Vs
 4PxvT5oihFkTkqtUDbsTyGXQvElnevxutqxmQ42Qnz1U2iNdPpmW1DWsFJ5nFnyjG8ox
 uUR3TdmzaREsdGwnWtwt2tJicGZdZ7hlsByikcC0CxaG2hgSW0CjZ/1DL4LL/Kg0rH/n
 x0CQG4c2BCNi9LBWFbXmDEsjxNAVih5IYMy70u6xwPAB+x/lwhyq8WP2hCu/ZtPRU/5b
 /6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1nNaT/PuaWLISehoqPixkzlXUj9kC9NZ6EI9OYHXpo=;
 b=0S8EFA3HRFGUr/2w7tsT/BhlwfsIKL6JlGoczESVK8o8r3BGsAeJv4vGJEjOiccg/l
 Ic241B4bQeKdBK0HbzUjSc2ahlcJe/5Bap8wIxn/62nvneK1YzHDU+w8sR7zrQcjOO+1
 9WLsPFQHh5faDqdlqr1N3QVJpWP3fxgOsCedqUtkj8l+hJd9PSdMbKg8seWCDwu7ncOj
 PcERKS9NBgzh7SFjZlWXc4ZvNMq12RxRdcDWdIZeDkey6sgkXtP7UvIO6j0KRtczKep7
 wzHNnLZStw3wPW++4GcN9CYtMYDcGL8OPBWgHqRmLUHfTWgita8SUHqejIaisVy4MCTO
 iRlQ==
X-Gm-Message-State: AO0yUKXSKUwWwPJOSn1ol97iQ69SGA4KtkuD1hKMA023mY2hmlvggvdZ
 ku2QmNKPe7cLI7KZZYVU9uLADv0fjAoTm6t9ihuhP9WJ
X-Google-Smtp-Source: AK7set+vjShKbC9ghO6+TXa0AR+ls0VQZv2lbNeeyWo3bmENuJPz04U5KPEwlcs6x4VB9ut4fS+4Ji1jei63W4lR4q8=
X-Received: by 2002:ac8:7f01:0:b0:3b8:36c3:acc9 with SMTP id
 f1-20020ac87f01000000b003b836c3acc9mr1899143qtk.25.1675615512809; Sun, 05 Feb
 2023 08:45:12 -0800 (PST)
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
In-Reply-To: <a395da31-5812-9fb8-6857-7da0bf1b8531@talpey.com>
Date: Sun, 5 Feb 2023 22:14:56 +0530
Message-ID: <CA+RDaRDGLQya8TzsUrBDR4vV28HcoxsEaJSE9_r9bn_Rc=f9BA@mail.gmail.com>
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

Hi Tom

I did test it with Windows share too and the behavior was the same.
But please note, the FILE_OPEN_IF I am chasing is for the Directory
and not the files.
In my case, the source directory doesn't have any named data stream.
The files in the source directory also didn't have any ADS. These files were
generated locally.

On Sat, Feb 4, 2023 at 7:38 PM Tom Talpey <tom@talpey.com> wrote:

> This is worth figuring out.
>
> Because it's a file in your Downloads folder, it was probably
> created by a browser. This means it has an additional stream
> which indicates it's from the internet. Defender and other
> tools use the presence of that stream to throw the "Do you
> really want to open this file?" dialogs.
>
> When you copy the file to a non-stream filesystem, that stream
> is obviously lost, in which case robocopy is not going to do
> anything special. But when copying to a filesystem that does,
> it will take a different path, copying everything. Or maybe it's
> the fact that it's in the Downloads folder, and robocopy is
> being clever. Or just a bug in the Win10 robocopy you mentioned
> you're using.
>
> Would you happen to have a Windows system with an NTFS share
> that you could robocopy the same file to, and grab a trace?
>
> It would give us the breadcrumbs to figure out what's missing.
> Maybe there's some other volume or filesystem attribute that's
> missing, and confusing robocopy.
>
> Tom.
>
> On 2/4/2023 3:17 AM, varun mittal wrote:
> > Nothing fancy, simple copy command:
> > robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
> > <file-name> /COPY:DAT /R:1 /W:10
> >
> > On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com
> > <mailto:tom@talpey.com>> wrote:
> >
> >     On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical wrote:
> >      > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
> >      >>   I was able to narrow it down to the "Named Streams" bit in
> >      >>   "FileFSAttributeInformation" response.
> >      >>   When this value is toggled from 0 to 1, as is advertised by
> >      >>   `streams_xattr` VFS module, Robocopy
> >      >>   switched from FILE_OPEN to FILE_OPEN_IF.
> >      >>   Thanks
> >      >
> >      > Thanks for tracking that down. What strange behavior.
> >      > I can't see why having a stream would make the open
> >      > change to optionally creating the file, but it's good
> >      > info to know. Thanks for posting the follow-up to
> >      > the list !
> >
> >     It's not the presence af a stream, it's that the fileystem supports
> >     named streams. It's getting that from a FileFsAttributeInformation
> >     on the root directory.
> >
> >     Robocopy has a very broad range of OS- and FS-dependent behaviors
> >     and optimizations. I bet there's some combination of its 1000-odd
> >     commandline options that can change this.
> >
> >     Varun, what exact robocopy command are you seeing this from?
> >
> >     Tom.
> >
>
