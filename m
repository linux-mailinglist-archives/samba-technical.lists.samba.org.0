Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB341E84E2
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 19:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Nfc4fAvMxd/7uVawZFFX4L5huuRAVgxn3zjhfdezlyE=; b=HY9OZMq+zw/qd3rO5kR9+h2+cu
	0hmbbgZMDoXkl4ldiATGf51DUFB9ucasB0DApg9jFTnuKu4xDofXAKmJPflW2ShnszHxg/LW1peAY
	DnTdB2dEiHXM560IfNrD4dQ2VDctlJE1Q1SPzCKU5UK6WkygPljFLeTGurQsIsPK4SKugxdOO5s5X
	zo2iulbdwJJG/ZNaVU3kmyZbYTLiFfBTYP+f9b/zR1VJcH1uCGZOmurcULkalqle/nLPHQEAh474M
	XoPi0XTu6NBWJM8N907hwgBcR+BKZKhsIFtaQNldwvAgYkS+Ne+LvJu+CbOGQfNZ6tbjX64rNQUc+
	qX1s5noA==;
Received: from localhost ([::1]:19748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeirT-006LcG-K2; Fri, 29 May 2020 17:32:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41319) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeirM-006Lc9-SB
 for samba-technical@lists.samba.org; Fri, 29 May 2020 17:31:59 +0000
Received: by mail-ed1-x535.google.com with SMTP id g9so2332256edr.8
 for <samba-technical@lists.samba.org>; Fri, 29 May 2020 10:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeIXm5EgYYESnS1zUUMLtxXeAc6F1xbZg11I/9Yvn9Y=;
 b=D1tRPAYD7TRfNVc3zDwATNMaWmcZMDy4ixAGrBPnRCYefszqwmWlnWw8RlsARsMQjs
 I+SS7LuWbIjUvTf6OJvU8OBd1EW5JHO/EXPYF7V6cDCXzjQ6b/cR2fZJvR08xXQK0pqt
 jQMryyd6CgQ80xMvA7iWjBm5hodvmudjPwhSk6UiThZJ3dbTLpVtpA6gQYyfWwKeY1lv
 uw7N6pbX90PUn6w9twBdX151OBTl9vTMug0aJOE79uRIjL//XtE9erLms82JRb09cFW2
 iP5u9Ww5wBeqYWwk2YZZH7aWXw/q8TVfZlLdKpgxQL4urWyZ0M1qE7HpaOwHEGkLn39D
 9HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeIXm5EgYYESnS1zUUMLtxXeAc6F1xbZg11I/9Yvn9Y=;
 b=nY7WGAzs9cg0SEqcuDJlwe+H+gSnOKp952RhOg5WhkIPNYe9VURX33u6UdeBb+YekY
 3S2FZLD1F5DzWbqIWWdsITXpmBgXTL+sIXQaKTkvUemMvg27Ruaspkm98IvZ9r6+w5TC
 4u+3A/81EBUucYqbqSATjJ9YnIkDVuZTEv4VwO14vA5fFF9cjJnD1my9GmUK6hm0P8Qv
 Ij+oZzb+aOmyVRD7qK/1ld0TNmoGWQPp4xiCOOoQz08zVz1XJXfj/eEAAYBovLDfHPRY
 g0HWW7ARgKQIli9pz7YKxv43IsyZzBMDa1uganntUH6n4SE91oMPEfJmR8M4jUJvN4Jm
 L/kA==
X-Gm-Message-State: AOAM531u05AnRFs8U2tSdEVUskg8tZnkQ2Cx5Lbq/26WTQa+r8BzrqGk
 Yj6jyR+rj+WK1zqrhGYeRaUwFHHQVbO8KWuesXQ78LGogBQ=
X-Google-Smtp-Source: ABdhPJzqb3fmad4CmIwkN6cvNAcenyIKlB/yiCnItXaADJHNfQeQGm5iX9z38i2LTQyGjxahLTcxKf502vbDe4Esd7Y=
X-Received: by 2002:a50:8165:: with SMTP id 92mr9445886edc.263.1590773515966; 
 Fri, 29 May 2020 10:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
 <20200529062444.GP5779@onega.vda.li>
 <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
In-Reply-To: <277f0fe0c0f811497189aa279380702cc1228838.camel@samba.org>
Date: Fri, 29 May 2020 20:26:58 +0300
Message-ID: <CAH72RCV1gDMqnKS6zw1XpR9v47hLGyrTVcxL+XDhVSKQLTfgPQ@mail.gmail.com>
Subject: Re: Checking if Samba is running as an AD DC
To: Andrew Bartlett <abartlet@samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks. I tried out the different ways you gave.
I also tried this:
samba-tool testparm --parameter-name=serverrole
which seems a little better as you don't have to provide the path to
smb.conf which could vary with different installations.
Well you can omit the samba-tool and get the same result with testparm but
would have to press Enter to get the desired output.

On Fri, May 29, 2020 at 9:33 AM Andrew Bartlett <abartlet@samba.org> wrote:

> On Fri, 2020-05-29 at 09:24 +0300, Alexander Bokovoy via samba-
> technical wrote:
> > On to, 28 touko 2020, hezekiah maina via samba-technical wrote:
> > > Hello everyone,
>
> > > How else should I check that Samba is running as an AD DC apart
> > > from
> > > looking at the smb.conf file?
> > > Is there a process that gives me this kind of information?
> >
> > For Cockpit integration you need to use systemd services to check
> > whether a service is configured and enabled/started since that
> > environment will anyway have systemd configured.
> >
> > systemctl is-enabled samba
> > systemctl is-active samba
> >
> > For the config file checks, you can use 'testparm' utility:
> >
> > $ testparm --show-all-parameters -s|grep 'server role'
> > server role=P_ENUM,auto|standalone server|standalone|member
> > server|member|classic primary domain controller|classic backup domain
> > controller|active directory domain controller|domain controller|dc,
> >
> > On non-DC system:
> > $ testparm --section-name global --parameter-name 'server role' -s
> > 2>/dev/null
> > auto
> >
> > Checking configuration is needed anyway because you get information
> > about the actual server role, not just that a service is running.
>
> G'Day hezekia,
>
> Welcome to the design session for your first bike shed!  ;-)
>
> Try (eg):
> testparm st/ad_dc/etc/smb.conf -s| grep "Server Role"
>
> Andrew Bartlett
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
