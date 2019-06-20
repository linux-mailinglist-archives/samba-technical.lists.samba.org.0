Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC14CCA8
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 13:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MdU+cDr22XpBtKMIn2cYDrFa2KQ2TSxbfdbzcbIco74=; b=hM19+cQdYGWDMSpb8PoZrJMcwR
	+YpMr56/+KteznVFil4rFCbO672FXpYGz9hKyiNCA9XD2mBW5DvOe2fHRLP4EEcio9yQ9j0Dz+pW4
	JiIzi0TpU5LkeiT7Iw4BmezEE+pptlPeR8xqW/Xk7mpCvzXQZ/wRLMwaz569WoumuccXvNtFhmwIH
	V1SR40ZY4SVnN3/w2z0en2m49m+R5IK1GmUiiM6Xmaosh7lStWphaCgZS8PMCg9m6J4/5Z9uXSewf
	DcP4goOxUCBKluH8JWfm92Gjo9QGg/NuubTNfDPz25vJZYgwxMzKfRUZ0GKY0oRgt8kB+uvevrOW/
	BRL7E1XA==;
Received: from localhost ([::1]:30642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hduyJ-000feY-QR; Thu, 20 Jun 2019 11:11:15 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176]:42165) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hduyE-000feR-QU
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 11:11:12 +0000
Received: by mail-pg1-f176.google.com with SMTP id l19so1401006pgh.9
 for <samba-technical@lists.samba.org>; Thu, 20 Jun 2019 04:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MdU+cDr22XpBtKMIn2cYDrFa2KQ2TSxbfdbzcbIco74=;
 b=e4BkxnzM7rTJLdTtvgqgRIJzoc0qDZMcRDedL2pml+JQ1tRyBWJhtlk9caG+iWFeoo
 yaDjKyCp06W1zmMegCKqAWWmJKMfgLVVQ072yx/ivAvoWqWXNRg5H/iknFyaIXLw81XW
 C0ZIkQHc1fmb2nLhn33szvBDr1wwIL+HLJO+y3rjwNPhe58GsyWRnjmeJppsC32xcqRn
 582lMTRSx80rp9OLoDi9kKA/jbGUWJx/rPzENOqQpFmd/ougFE4P8N1h8b6Xfdkxcpg3
 U/3NmQJVM4Eq/SSB6x9uJ6O9Y88DWYJLJvOPDOJQ8y0jWs10plY1MD/O17/zq/Y15ulW
 ny1A==
X-Gm-Message-State: APjAAAV3AtAHx6dfc9Lf1rF/ndCBbnhK453Az330yccoY8WCsUNtloKm
 7UU5a3bYezX+tdhTZatmss5jslZolSQ=
X-Google-Smtp-Source: APXvYqzXWPymb+KSMslOakAlfQ2N2tvQvOx+NDOssTUQcfwvGWb9hwFnedD9cVWfe7qlJ0Vl2kIgoA==
X-Received: by 2002:a63:1450:: with SMTP id 16mr12802566pgu.52.1561029067985; 
 Thu, 20 Jun 2019 04:11:07 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id l1sm21349173pgj.67.2019.06.20.04.11.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 04:11:06 -0700 (PDT)
Subject: Re: Every-time Pipeline failing [Pulling docker image
 gitlab/gitlab-runner-helper:x86_64-58d8360f .. ERROR: Job failed: execution
 took longer than 1h0m0s seconds]
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
 <5d99326e-ebee-ae3d-a882-b1ae68fb1b8e@redhat.com>
 <046412e248fe9e2ed537e0b92b56e202364a97e1.camel@samba.org>
Message-ID: <bab720e0-d204-b0c8-4da6-5917bd659bf3@redhat.com>
Date: Thu, 20 Jun 2019 16:41:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <046412e248fe9e2ed537e0b92b56e202364a97e1.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey Andrew!!

Great Success this time. I am Happy :)

https://gitlab.com/samba-team/samba/merge_requests/524

Thanks


On 06/20/2019 12:46 PM, Andrew Bartlett wrote:
> On Thu, 2019-06-20 at 12:38 +0530, Amit Kumar via samba-technical
> wrote:
>> Dear Devels,
>>
>> My pipeline(https://gitlab.com/amitkuma/samba/-/jobs/235933064) keeps on
>> failing on "samba-ad-dc-2" test case.
>>
>> Pulling docker image gitlab/gitlab-runner-helper:x86_64-58d8360f ...
>> ERROR: Job failed: execution took longer than 1h0m0s seconds
> In your project settings, set the maximum pipeline time to 6 hours. 
>
> Or join the shared development repo which will run the full testsuite
> (overkill for docs, but good for next time). 
>
> https://wiki.samba.org/index.php/Samba_CI_on_gitlab#1_hour_Timeout
>
> Andrew Bartlett


