Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7045FFE1
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 05:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gt90+YBqJrHQQCDeKj2//ut6COY7OOnD1hwhgBvRrSA=; b=LL4WWlaG6kYwCxXDMqSlzN91E6
	h8rSwKix3nEpGZ1M2N2rxwk3cWbwAo0bDs/uLZIsD0NNvwYbUr8/B70C1OLnDvZvZzHK6Ajc9EnAp
	z1f7L3tBegUWPoKsFdcZZCIylUfk+5JJUXYDHuzPDqOPIs3NXSoZxuDqiblKRHtVfcKx1Pdy2x1wD
	UoGwYsUPDV5Wv1fG2WUWU3yDkaL8Pf8+PkFdKI02/Q/MqHrUgy70mNzn5q1W+61RRpoyipKfIRfVk
	LfRlgZZ5AS+Tp/V7iQkOxCiL6v6dSC+0RB9bPOVP9cvCIdBwC1TxVoWrLtzpZIFQ+L7VKDNrJB/dR
	gFyy8tjg==;
Received: from localhost ([::1]:18982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjFHI-005GrL-MF; Fri, 05 Jul 2019 03:52:52 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjFHE-005GrE-9J
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 03:52:50 +0000
Received: by mail-ot1-x343.google.com with SMTP id d17so7753659oth.5
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gt90+YBqJrHQQCDeKj2//ut6COY7OOnD1hwhgBvRrSA=;
 b=IRL3nSr8cX381BxxzbB2fVa0IeQp3gAnpuw40K9eXFTeKvwX63XjxW7mUVBNOCglM3
 o81FZnc9uy1xrx3o+XDq3bJgCV70/r4KagW/xSBmvbZPR0KeEf5d10aWINYJRpy7stHS
 7EwcbxjXf/6pM0lE4gprB1xepvCizFencr8jN8jJLu860fHS/vdUbz7MWbqC9g1V3ZYW
 TbkrEQxdbtJ5gHXeFWhRXCCyWxDx6ctVUrKoYhQ5jFRnHS1e5InaHZuJTnJ0tIU1NcjJ
 jhlr0gHLEpsC0V0iLiiK/rsSpnF5Ggu5I6g7em9/jQJ0nu+un56JbtV6xh2V3823EIKq
 ucIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gt90+YBqJrHQQCDeKj2//ut6COY7OOnD1hwhgBvRrSA=;
 b=U1/bWoP38EqnunPH3ywe01l42JzEkkDyneShP6UH2pQ3NJv1zxisN4Ow7Y7Zi/TjTd
 aDH0iPLb8thb5iMAOpHrY4mQ6kGBrBO8Qg18+ikTtgH/7TynU0NgQHb6E9TJWEp72fmr
 tG6mJd0ahMkYRZaJUj+d654nebUmvVQVr9okRxD9Qv4l6iS9BvllaqglUZTpKeG1rFXq
 K+fqNXqN+wHqbDD3jOksnjUhMAOM81bLeBNaizY8K7c9QpQCrNz5gsP3YylOwB7iMUSJ
 vLGYfxAlj+R1giPht/vFwv5Wy8LHvRd4cyYTXFAgDc+1HqYvxG/7xB7EYoxFQ5NVb75i
 XiCA==
X-Gm-Message-State: APjAAAX3HgZZJDZzVOlAUTlOIkvPsUP7om3SK/IiadVtOJqDh2vembmf
 hEq6wD4upR9PrMtDc8eRc2o8Luwjw5seVknX4luExQ==
X-Google-Smtp-Source: APXvYqxAv+lhWJoFtIKzptaRrefwS/FcnNQsXl1MqGEeTNvwh9FNdmx3JaWFweLTYm/+zBCHuYcehEsNxGBTRLYsRxc=
X-Received: by 2002:a9d:578c:: with SMTP id q12mr1039763oth.240.1562298764368; 
 Thu, 04 Jul 2019 20:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703184701.4f93d776@martins.ozlabs.org>
 <20190703185302.00e2b627@martins.ozlabs.org>
In-Reply-To: <20190703185302.00e2b627@martins.ozlabs.org>
Date: Fri, 5 Jul 2019 13:52:33 +1000
Message-ID: <CAJ+X7mT9yad=PyOqrbOMaddgJa1GVDq1xBr19hjYqQEvbAkPZQ@mail.gmail.com>
Subject: Re: [PATCH] CTDB onnode simplifications
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 3, 2019 at 6:53 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Wed, 3 Jul 2019 18:47:01 +1000, Martin Schwenke <martin@meltin.net>
> wrote:
>
> > Simplify and drop output filtering in onnode.  This avoids onnode
> > hanging in many circumstances when a backgrounded process has stdout
> > open.
> >
> > https://gitlab.com/samba-team/samba/merge_requests/606
> >
> > Please review and maybe push...
>
> New patch attached that also removed the documentation for the onnode
> -o option.
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

