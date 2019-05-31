Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987830ECA
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 15:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pyYsPFUA0zOU54jS3P4BSObWIumYGoimLRKqsy0dIcw=; b=gOc0TIT4lyIijS9ntzO5hu+sTa
	7OdFITr4nBfG+VrNSPSRmxFk0Qt5SjVf2CVUwcL/teWslBBpSNOUnUnYaO5NnnbydYbazEHadCUMV
	tuFwUOqJT/OPwGU3wJKw/Uj4qzFrxco8+c+TBvHk66xBDTouZIhctC5ko9O4KECm9Z6n/JvTocz41
	gfe8T/ovu9x9/E5vIIY9iEidPJ01JOXUfGEb9iNjLzDxuzSMALTp2i8v4L54P6fnMVUe80WE3mQhM
	gelDOQ4AsZRyVL/vszNhG3CcJI3QwGjKRuWCw9enZtv+gqXWH6m6WbtKW409aVvl9wk4sk2upgI7W
	pGnPzS8w==;
Received: from localhost ([::1]:22456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWhVi-002kDz-9M; Fri, 31 May 2019 13:23:54 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180]:40991) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWhVd-002kDs-B0
 for samba-technical@lists.samba.org; Fri, 31 May 2019 13:23:52 +0000
Received: by mail-pf1-f180.google.com with SMTP id q17so6219862pfq.8
 for <samba-technical@lists.samba.org>; Fri, 31 May 2019 06:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=RmnhK7XCrzT1sLMwJhgoJSvPOVw8Rgf9sGm/W7xOUy8=;
 b=aGe4IRGXEuE6WKYuvg3lTysvq/yB/4s19wyqeK/oHQD29cvyJu0YacXucq6IGt4pCM
 xyzUdrva8uae319McNSVCy07CGiOKTAbPonbr3gJMEZKiJ4UXsi0HKnwyZTp2E2DEHij
 HsafxEgKUYjZ7nCguRmKtt/JAoI1R4CP9Ag8Yi3mtO3TMOSynR2NZywvT2fnnwKqY8Qd
 lH09J2VKTw4vV56OgzLNPPbAx8+c9uUAoJrUaCQ5BMVBj8riqo0/pZmXzMuWlDbexZ5m
 XGepm2ntjcNE2W7diIXQLq1dVDH63ioAoq2qZMXaSt2JfC3OgfJ611vv/it8aTHmI5D1
 jSAA==
X-Gm-Message-State: APjAAAWoLNQvOGAGCecC1oskRI0122pixSAZpjBr2lrTsy/zi77VRN0B
 n8J2yH9Jx51LuZf+L/eeRWKDIMYpBm8=
X-Google-Smtp-Source: APXvYqyPvbsxFBfi2As9eIqj1M3nveF9ogtHX42JOhXW0f5TfqaP2JIDLRIWPC15us9fi/o2tKyBHA==
X-Received: by 2002:a62:ae19:: with SMTP id q25mr9847650pff.35.1559309026542; 
 Fri, 31 May 2019 06:23:46 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id r7sm9531139pjb.8.2019.05.31.06.23.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 06:23:45 -0700 (PDT)
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: Stefan Metzmacher <metze@samba.org>, Ralph Boehme <slow@samba.org>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
 <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
 <cfa5b581-096d-7b08-24e5-010009fda94e@redhat.com>
Message-ID: <2e4a105b-9ca1-0c1e-d890-a1c1c61c799a@redhat.com>
Date: Fri, 31 May 2019 18:53:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cfa5b581-096d-7b08-24e5-010009fda94e@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey slow/metze,

https://gitlab.com/samba-team/samba/merge_requests/515

Pipeline again failed.. cannot understand why!! can you try understand why?


On 05/31/2019 02:22 PM, Amit Kumar wrote:
>
> On 05/28/2019 07:19 PM, Stefan Metzmacher wrote:
>> Am 28.05.19 um 11:56 schrieb Ralph Boehme via samba-technical:
>>> On Tue, May 28, 2019 at 12:47:05PM +0530, Amit Kumar wrote:
>>>> Created merge request:
>>>> https://gitlab.com/amitkuma/samba/commit/1a6f331445364de623d02425c8d8b46a59eb2c53
>>>>
>>> Thanks! Unfortunately you targetted the wrong repo
>>> (samba-team/devel/samba instead of samba-team/samba).
>>>
>>> Please follow the instructions at
>>> <https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_developers>
>>>
>>>
>>>> Attached patch as well.
>>>> (0001-s3-winbind-Not-abort-when-received-NULL-SID.patch)
>>> you're somehow munging the patches, replacing tabs for spaces, that's
>>> why the patch again doesn't apply.
> I will be adding spaces not tabs now!!
>
> But don't know why these 2(samba-ad-dc-2, samba-ad-dc-5) stages failed..
> Looked into .shared_template it runs autobuild.py
>>> Looking at the patch, I wonder whether we should skip the trusts with
>>> null-sid instead of adding them?
>> I'd also prefer to skip the domain completely.
> I believe bringing domain check before if() else() would skip the
> complete domain!
>
> +                       if (dom_list_ex.domains[i].sid == NULL) {
> +                                        DEBUG(0, ("Trusted Domain %s
> has no SID, Skipping!\n", trust->dns_name));
> +                                        continue;
> +                       }
>                         if (has_ex) {
>                                 trust->netbios_name = talloc_move(array,
>                                                                  
> &dom_list_ex.domains[i].netbios_name.string);
>                                 trust->dns_name = talloc_move(array,
>                                                              
> &dom_list_ex.domains[i].domain_name.string);
> -                                if (dom_list_ex.domains[i].sid == NULL) {
> -                                        DEBUG(0, ("Trusted Domain %s
> has no SID, aborting!\n", trust->dns_name));
> -                                        return
> NT_STATUS_INVALID_NETWORK_RESPONSE;
> -                                }
>                                 sid_copy(sid, dom_list_ex.domains[i].sid);
>                         } else {
>                                 trust->netbios_name = talloc_move(array,
>                                                                  
> &dom_list.domains[i].name.string);
>                                 trust->dns_name = NULL;
>
>  -                               if (dom_list.domains[i].sid == NULL) {
>  -                                       DEBUG(0, ("Trusted Domain %s
> has no SID, aborting!\n", trust->netbios_name));
>  -                                       return
> NT_STATUS_INVALID_NETWORK_RESPONSE;
>  -                               }
>
>                                 sid_copy(sid, dom_list.domains[i].sid);
>                         }
>
>> metze
>>
>>
>

