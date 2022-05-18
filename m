Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18852C102
	for <lists+samba-technical@lfdr.de>; Wed, 18 May 2022 19:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bdZkDiGvujqRLhcHPm6Yoeak3thr0Kh1DD7+XWm9LiQ=; b=cyjvJrkXeCNTvjk7I9qRnB1tY9
	J7GxWRSxldr5n+aXopgx5tIUx/VMasMw+lPqAcrr8Czn2SHlwxKdLiyjkqj/N+JNO1uaZ7oi8YpVg
	LsQ8gFJ0cGGjvw/9hDl3gp2tMJ4hDrK7tQaROIvXQt347FkcerCvJKibOFdeNjaWAGuLHIGkg8XoZ
	2drg6V+fJQPKkMCgiH9ZA8mqlwgU3MBQsgi1IEkAovvCte2QEYh8sa8UX4/9GHq7LSZiDJYLSwXQd
	kvtv89EWIvXyJlGjS27srtd7JB3hWOOrZs1ZyQZXRr0o4MSoTqArwpTRegJ2pFPWQxrKDp6RLE8R+
	v4MAPAYg==;
Received: from ip6-localhost ([::1]:37432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrNbN-001wgX-Od; Wed, 18 May 2022 17:36:49 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36777) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrNbI-001wgO-3q
 for samba-technical@lists.samba.org; Wed, 18 May 2022 17:36:46 +0000
Received: by mail-oi1-x231.google.com with SMTP id v66so3533128oib.3
 for <samba-technical@lists.samba.org>; Wed, 18 May 2022 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EN78EZoxDEackX/RrLlArbX4lrTbWNodq6AnYTecb+g=;
 b=ZdPYVMnPSzjj7dk1j4wFNzl3XfEk6XgfXLxl0vFSRoWsf5q6vouMKttFr1rU8SCrKB
 kcWNnDh6rgHM5YieH1K15+sq/HvlalO91NbA0gxFhQNUXCKMU3mGCtpGTKnzZynFhM6v
 Bj4mAQ6Q1gTx67Vd5gjFJ1kt0CLlOAKvz8zU9byQ332aaiajPt1W2xIvEb9kjAYUXjWq
 Vmohfj3Mjsw3qxzX9C7L9OTylwtLO7xNk/8enEi8TY8Z7D0rWBBJTW8lVRWtYF+sNPbs
 7cWbg2m4TyXm8HojTjksLLUtwhrl4AhcZ1H8Zwria8i452c4VrPr/y1V5QxMusGXeCmo
 f1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EN78EZoxDEackX/RrLlArbX4lrTbWNodq6AnYTecb+g=;
 b=smFAByv7QNs9Pu+b/WpEeWWyzYFKA7/4ta12XOKGcDtTiRbw+MtnZn2rr+SyBhxLBd
 dPv4CY4IsSfe+9b/clju9O+A+h43cibxzwfFeoU0Q7Pjz6J0PPLeibtjEL/wukHjF83Q
 m77odZsl3HiooZ2ryrxlSLrp/UeQO8KJKAfF5H993WW1l9lZM8Ye35YkY8oJGTYkRJNV
 /04vERZNlfef8QRWEl4+6OaBa+Pt6KqsXC96PkuNK+Ldq+elBcahp2tZXNxEKyp2JRcy
 mLMWS19+KUAJZL0xOuTU4nkiatfZRZYJ0UjHHytccMkhtFDHF7t8dSot5Zx+JGtIe6GP
 DKGA==
X-Gm-Message-State: AOAM530NtmibJdnpWymjLelrCZXZdK6/4h0sELybGfCq7PGndSWFTfqH
 6q8IfAOohtLqc7JDFTKNXySjz6yC5YT7udM3/bc55tWd7Kk=
X-Google-Smtp-Source: ABdhPJzOs6KP0ivqi5cX8CiRX7mw0f9YkjSNsy4Em4Rv2goALJ5MwjabdIucvFcftyxN0rfZv8+VRdvRElxVKY6Y7B4=
X-Received: by 2002:a05:6808:218f:b0:326:3e31:bb12 with SMTP id
 be15-20020a056808218f00b003263e31bb12mr597602oib.166.1652895401913; Wed, 18
 May 2022 10:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM61p32DPdUCwLLSXx7Pez_HD8xc7nLQYkVhZFrhNDJ5wT7yBA@mail.gmail.com>
 <68118e13ab297de53be260deeeb3094563ce7f3d.camel@samba.org>
In-Reply-To: <68118e13ab297de53be260deeeb3094563ce7f3d.camel@samba.org>
Date: Wed, 18 May 2022 23:06:29 +0530
Message-ID: <CAM61p30zXBnE9dTuyUN=dnqJzJh-=+5W_OvH0hTMGJD4K9Gr8A@mail.gmail.com>
Subject: Re: ** server can't find 36.40.168.192.in-addr.arpa: NXDOMAIN
To: samba-technical@lists.samba.org
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
From: Prince Chaudhary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Prince Chaudhary <chaudharyprince64@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Rowland,
 I have this mail id only, can u please share mailing list email id.


On Wed, May 18, 2022, 12:43 PM Rowland Penny via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Tue, 2022-05-17 at 11:55 +0530, Prince Chaudhary via samba-technical
> wrote:
> > Hello Samba Team,
> > i am getting this error *{** server can't find 36.40.168.192.in-
> > addr.arpa:
> > NXDOMAIN} *while i do nslookup to my server ip, this came after i
> > added
> > reverse lookup zone and tried to get server name using ip address
> > although all other tests are successful, could you please guide me if
> > i am
> > missing something?
>
> You are asking in the wrong place, trying asking on the 'samba mailing
> list'
>
> Rowland
>
>
>
>
