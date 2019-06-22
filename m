Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3C4F3CA
	for <lists+samba-technical@lfdr.de>; Sat, 22 Jun 2019 07:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pgIQXN2BAzdUQ2l3Jc0pMKAPeSACyi93Cvy9aQCHhCo=; b=I02no/xCH5vR7K+vI4CZHhjSgk
	sc3b27E5ZyJ0rV4RemwbDLuMhiSQw4ZmTYkAiLYB7ghBNGpFS32WOoDDPECT6fNehzARs9wWR0HQm
	wCiLo/RXJ3Re+qkoWtQdhqvfPswHe4xLnn339rBqBA/ImlnCmQl8l0SVRUk222DpXMCSkcUp78uXP
	Rb6NUuO+yT5cY0U0yBhfoD78tYmmeZ4VHRJzylWyiB6D+tu+KxID2lJxtZEWnNgHf6aTtsjLTO2M+
	ldyg/7TFKYBhRmr44/4gTahmq6wq6VxUDOlgRlr0ZvcQj+JgTjBmTRFhiPfdCC60akG9ge5JDJDB6
	vYu/9NVQ==;
Received: from localhost ([::1]:46274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heYCD-00169t-HI; Sat, 22 Jun 2019 05:04:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46302) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heYC9-00169m-2f
 for samba-technical@lists.samba.org; Sat, 22 Jun 2019 05:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=pgIQXN2BAzdUQ2l3Jc0pMKAPeSACyi93Cvy9aQCHhCo=; b=fbhZY3jw1nI2msrKKUJeJLIRa0
 xgNktjVJ+z2/NlyDsOX/GpYd644hGa/o+lFVncXS2VZz7I7atFVjMBzx2Po0kZvYqUWm+aLKXMZq5
 AURKMYFC37TB4euEyjoBGenmejTWA0ehz3zv8g1g/ZxftmqLSa6dz4wMT8okcvv0m0bo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heYC7-0004xt-OD; Sat, 22 Jun 2019 05:04:08 +0000
Message-ID: <71ad9ba3182d72cc7ec7f398d5f61368b5434169.camel@samba.org>
Subject: WANTED: gitlab automation help (was: Re: Document GitLab as the
 only way to contribute to Samba?)
To: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
Date: Sat, 22 Jun 2019 17:04:03 +1200
In-Reply-To: <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Sat, 2019-06-22 at 07:30 +0300, Uri Simchoni wrote:
> 
> A bit off-topic, and maybe the following concern has been raised and
> answered. My gitlab experience is a bit dated so maybe things have
> changed, but it seems to me that the mailing-list style of review
> keeps
> a better track of the decision process that led to the way the code
> is
> (and I for one used the samba-technical mail archive more than once
> for
> that purpose):
> a. With online tools, a revised MR may trump the comments made by the
> previous version.

The history of pushes is included in the history of comments on the MR,
if that is what concerns you. 

> b. How to find the MR from a commit hash to see those comments.

Currently this is just as poor as finding the mails on samba-technical, 
but there is hope.  We either need someone to write a script to watch
the merge requests for the closing comments mentioning a git hash and
to tag that commit with a git tag named after the merge request (eg
gitlab-mr-456) and containing in the text:
 - the URL of the merge request
 - the test of the merge request description

> c. All this information (MR comments) is kept outside our control and
> may not be available should we decide to move away from Gitlab as a
> hosting platform.

We also need help to automate the backups from GitLab.  We have access
to the backups (and I take them sporadically) but we should be doing
that nightly.  There is an API behind the web button, I just need
someone to find and write the tooling for it. 

This URL should explain what is needed, and we could store on our own
server or in S3 at rackspace:
https://docs.gitlab.com/ee/api/project_import_export.html

Bonus points if someone has the time to prove such backups successfully
reanimate into GitLab CI. 

Finally, we do have an archive of all comments because the 'samba-team-
bot' listens on all conversations and I have all those in my INBOX. 

I need to work with the root team to send them to a team-readable
folder. 

I trust this clarifies,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




