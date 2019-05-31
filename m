Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E3D30AAB
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 10:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=96MG/N+pF60s+zM5934/XnD0M+ynDnkws8iIet8S/RE=; b=f1qISkx7d6ADMbkXCWLNBZU0mY
	Pg1rjQZY4jL/ER5rsV8mRl1cCIWYn1p92igwbniMd5KPvYVt6Q+4ymgP+JQf9sJE4qSVfMbFRHeWZ
	4EYY7yBxZjUD9yMMSueudamS1Fm1JUmOR+nKQPNuJc9ykgGyxmB4HRFyvYWZ6EoPyRmAagMT+7kh4
	NU5aNty2WaW1Oa+3+QDgZQ7jHVrbJZu8YpUK7+088EXRLqj/lE4vlVhxwkKVTlQdlIlsUhid1Dk4w
	W+b4W4xQWDZOFunz7tg8g+kZMv+9hsYjyEZzufJ75LYjdNWiAMH9Y0rVKr4iTFP49Hr8r1Au7gwnV
	By5XsLoQ==;
Received: from localhost ([::1]:57402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWdHX-002i5d-Sw; Fri, 31 May 2019 08:52:59 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180]:41268) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWdHS-002i5W-W0
 for samba-technical@lists.samba.org; Fri, 31 May 2019 08:52:57 +0000
Received: by mail-pl1-f180.google.com with SMTP id s24so3606159plr.8
 for <samba-technical@lists.samba.org>; Fri, 31 May 2019 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=AN6jtHsS3PWg1nmNA4pc0Vchw6RK3eKLJZB82p8SSj8=;
 b=Vz8ORDtWSTL2LwWUQV/k2V6uQxt/2L1F0tapBuYPVYcFK2LgN13eTdvrK2QS7bW/e+
 phpQlJ1MiVI/IkpWdYudlT9UHrFJdnkaZgSQR9wETwFQ1kdUD/aH79HeBw2gdUhqGhLA
 9aMuHVP//W67UTchncy0LPcYoPZvf3kR82Q/moHgy5pMYhoT7BGI969RF3kzPBePmTo2
 l0T3oDaf4bY5ekWhJ9KwZf+fdKpS+vaDNumHLi5WpMNVeDqwTOR0WvdhKGO6d3UcUhVs
 Md00sFbuOpLvvrArxzrOHABGnZPV4yHoRFQlHjPx7cfSBPsYInYJZU3tTku4lsV8WlDr
 S1RA==
X-Gm-Message-State: APjAAAXDKz9u1mohoPpFJ/iS/GBseRiOQ0kX2i/VWcDQtO1W0V0+4dqH
 VlaO4CBCcB46dFbbcJa8Wb11ANNx8P4=
X-Google-Smtp-Source: APXvYqyqk4MOrQFMxxAOFsl6mYNMboqafO5avYyvcQC+biRKJICf0O4F+QmT2G6zC0IibfdSfLr6fg==
X-Received: by 2002:a17:902:f20b:: with SMTP id
 gn11mr7838230plb.126.1559292772425; 
 Fri, 31 May 2019 01:52:52 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id y7sm10389250pge.89.2019.05.31.01.52.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 01:52:51 -0700 (PDT)
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: Stefan Metzmacher <metze@samba.org>, Ralph Boehme <slow@samba.org>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
 <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
Message-ID: <cfa5b581-096d-7b08-24e5-010009fda94e@redhat.com>
Date: Fri, 31 May 2019 14:22:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
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


On 05/28/2019 07:19 PM, Stefan Metzmacher wrote:
> Am 28.05.19 um 11:56 schrieb Ralph Boehme via samba-technical:
>> On Tue, May 28, 2019 at 12:47:05PM +0530, Amit Kumar wrote:
>>> Created merge request:
>>> https://gitlab.com/amitkuma/samba/commit/1a6f331445364de623d02425c8d8b46a59eb2c53
>>>
>> Thanks! Unfortunately you targetted the wrong repo
>> (samba-team/devel/samba instead of samba-team/samba).
>>
>> Please follow the instructions at
>> <https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_developers>
>>
>>
>>> Attached patch as well.
>>> (0001-s3-winbind-Not-abort-when-received-NULL-SID.patch)
>> you're somehow munging the patches, replacing tabs for spaces, that's
>> why the patch again doesn't apply.
I will be adding spaces not tabs now!!

But don't know why these 2(samba-ad-dc-2, samba-ad-dc-5) stages failed..
Looked into .shared_template it runs autobuild.py
>>
>> Looking at the patch, I wonder whether we should skip the trusts with
>> null-sid instead of adding them?
> I'd also prefer to skip the domain completely.
I believe bringing domain check before if() else() would skip the
complete domain!

+                       if (dom_list_ex.domains[i].sid == NULL) {
+                                        DEBUG(0, ("Trusted Domain %s
has no SID, Skipping!\n", trust->dns_name));
+                                        continue;
+                       }
                        if (has_ex) {
                                trust->netbios_name = talloc_move(array,
                                                                 
&dom_list_ex.domains[i].netbios_name.string);
                                trust->dns_name = talloc_move(array,
                                                             
&dom_list_ex.domains[i].domain_name.string);
-                                if (dom_list_ex.domains[i].sid == NULL) {
-                                        DEBUG(0, ("Trusted Domain %s
has no SID, aborting!\n", trust->dns_name));
-                                        return
NT_STATUS_INVALID_NETWORK_RESPONSE;
-                                }
                                sid_copy(sid, dom_list_ex.domains[i].sid);
                        } else {
                                trust->netbios_name = talloc_move(array,
                                                                 
&dom_list.domains[i].name.string);
                                trust->dns_name = NULL;

 -                               if (dom_list.domains[i].sid == NULL) {
 -                                       DEBUG(0, ("Trusted Domain %s
has no SID, aborting!\n", trust->netbios_name));
 -                                       return
NT_STATUS_INVALID_NETWORK_RESPONSE;
 -                               }

                                sid_copy(sid, dom_list.domains[i].sid);
                        }

>
> metze
>
>

