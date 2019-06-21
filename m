Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADC4E717
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 13:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CUaoV5Ytga0hLe39K/NXpFlRcpFDr5iD1ylxlTAdfRk=; b=sEFwuMS7NMUVvFHQx6tOhiib9A
	1CHcpWkosipvTNXGlR5Tcs6a34CMZVtucNvPMcNrAv/8MFkPnCuc5S8dUSS2uE3rTrPr4CKn8qdw9
	gToNCdoaaHDKEncVh8o/XDIyLhzCHrJ4pHuUQ0kN1W4tKjLfoiQSaMMFLPXXEQHIugbG4q3+i9JVx
	XX7Wh9oFlYoCvVKCnyfg7+UpqbhKam72xHCePm2xZQfS45+KtbhDh5kyksdkDxzj2MNIuq/JwfedN
	2aW6Z3Ij9Xb8j0hbDslJrNUsMFVZyJNNPQnsJI1m08msuIQoSSf+776y06PtHdT5iPMZOgu8EbSm1
	S521mPPA==;
Received: from localhost ([::1]:41680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heHhK-000xnP-Kw; Fri, 21 Jun 2019 11:27:14 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178]:44289) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heHhG-000xnI-Bd
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 11:27:12 +0000
Received: by mail-pl1-f178.google.com with SMTP id t7so2847186plr.11
 for <samba-technical@lists.samba.org>; Fri, 21 Jun 2019 04:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CUaoV5Ytga0hLe39K/NXpFlRcpFDr5iD1ylxlTAdfRk=;
 b=ryD3GVl0vdAIQcjhRcmSXWM8mOQjbxhOCnEEJIOzk0fYSSYNNBJ3SasLubgPboDhOp
 Srq7Z/pQsi5yACguRzKG49NBdZJENpIo7rnoyy3ACf4lUoiYVAInmoIRiuJ5Tp0QgttC
 dmDhMQZOR2oiqoB35y5vjsYcwSPpGQRnE758wxuCqIf3863Cq0xOmg5mNlQDZLydcIvZ
 A67oxJkRU+EmuP9ONaJYHrJTJeD4Rz1DsEMiTo3qzHu3t9G5lwPb9rUFYTzIRBeZN7IA
 fBps+oJrr0fNwDDzLSBiyPGwT3gXtliZBWrmaTfMi3G4UW/Q6y7NFeOsNtGpsMA2EFh+
 x6JQ==
X-Gm-Message-State: APjAAAWgY8HTLesjC3zne5vgdPXEgCy8OkOassvIstoKpXiihwoRQwlf
 E5lWzkP29P78yQxCr873lu2Ohy0mnos=
X-Google-Smtp-Source: APXvYqzRl5D6ZqnNuk+rXfylnE75AkhzlKz0Y8aXJybgVHyVvreoWH3wAYgmcknEq1VHeKbcBvbfnA==
X-Received: by 2002:a17:902:e208:: with SMTP id
 ce8mr13116973plb.205.1561116427729; 
 Fri, 21 Jun 2019 04:27:07 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id bo20sm2626750pjb.23.2019.06.21.04.27.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:27:06 -0700 (PDT)
Subject: Re: Every-time Pipeline failing [Pulling docker image
 gitlab/gitlab-runner-helper:x86_64-58d8360f .. ERROR: Job failed: execution
 took longer than 1h0m0s seconds]
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
 <5d99326e-ebee-ae3d-a882-b1ae68fb1b8e@redhat.com>
 <046412e248fe9e2ed537e0b92b56e202364a97e1.camel@samba.org>
 <bab720e0-d204-b0c8-4da6-5917bd659bf3@redhat.com>
Message-ID: <ec365071-a5d9-34f4-fdcd-812c39af2a62@redhat.com>
Date: Fri, 21 Jun 2019 16:57:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bab720e0-d204-b0c8-4da6-5917bd659bf3@redhat.com>
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

Hey Andrew,

Can you please review this?
https://gitlab.com/samba-team/samba/merge_requests/524

Thanks
Amit

On 06/20/2019 04:41 PM, Amit Kumar wrote:
> Hey Andrew!!
>
> Great Success this time. I am Happy :)
>
> https://gitlab.com/samba-team/samba/merge_requests/524
>
> Thanks
>
>
> On 06/20/2019 12:46 PM, Andrew Bartlett wrote:
>> On Thu, 2019-06-20 at 12:38 +0530, Amit Kumar via samba-technical
>> wrote:
>>> Dear Devels,
>>>
>>> My pipeline(https://gitlab.com/amitkuma/samba/-/jobs/235933064) keeps on
>>> failing on "samba-ad-dc-2" test case.
>>>
>>> Pulling docker image gitlab/gitlab-runner-helper:x86_64-58d8360f ...
>>> ERROR: Job failed: execution took longer than 1h0m0s seconds
>> In your project settings, set the maximum pipeline time to 6 hours. 
>>
>> Or join the shared development repo which will run the full testsuite
>> (overkill for docs, but good for next time). 
>>
>> https://wiki.samba.org/index.php/Samba_CI_on_gitlab#1_hour_Timeout
>>
>> Andrew Bartlett


