Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 027BEEB820
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2019 20:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Q4DqZpglI3W/71mnyWSeWF824WOz+5/GYh0qiprWFyM=; b=khuSsLzba8R6Ihdu0T4TlpEXmq
	p25m3vN0w0+IJiQU9Uwrx5V55vDXn9JPUudHM2/k4VorBvhxa35isC5dFWuSb3tEBQtjUfEz2ES/w
	Qudftcf9C1p2mLEQ/NuRtGPqFdkbmz4gQtONpS7jmu+coS9VKdbbO+SFBWBsyBxZhV/RGCJEKW3z/
	yeIOVeqt35AvGMLVV3xvC2Csz/na1ElsdUZorxWgXOi6ZuKUanQwC82aWSIt1H2JYBUyeaLcrvmEU
	oLw6neqoeKiTAXTMuRxxv4kzGBb8hRqvexBcIUNMp1bJUz20XV19eKS7ITJknN4TrjFNA8SkZc1h5
	jmcfMB2w==;
Received: from localhost ([::1]:46936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQGSU-00439b-A3; Thu, 31 Oct 2019 19:50:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQGSL-00439T-8h
 for samba-technical@lists.samba.org; Thu, 31 Oct 2019 19:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Q4DqZpglI3W/71mnyWSeWF824WOz+5/GYh0qiprWFyM=; b=23m6c0UPPizW6fKwphX4Rz95X2
 4M3kcxs270eLLgi06Ikd9MhvENC/3/6QamhVKiO4n3N9JXZ//JU/kqrSXkmXnkCeCQ4/+ufnydME2
 5qyo8qaJIK5VTAuRKua7apZDvBcnZahUQRz6pNfFldStbjLjr5ze6SCZXqABZZHU+pAtXU+nKcK1B
 5gOEIGWT5jUikU6cnng2Zapv999Cz89qr+kS0rVvmJ68o7be1h2yfxy17aczxm0zOkGHu+yk9WSyu
 408cWhVzlDDqEFGdHZ0tPtVBl+mEoU1menygzhscGWCdVz9axy3iMokFOUoc2dCp6R4qnoJQ4LjX5
 ARXzAVHOCp3QUSeayPO4pISxQOOcdNqqGjFZ7PF6665tgLxwj8Y5ueDSXiOr8sVf/8rLa5Vvv09/t
 SP2Xb7GWCuAj/uCZeYof6EbK3nevVAXoeZBmsPMLb44Tdqg+QxyIIRxjekCoOUCNS9gLsDIpm0nCy
 uaMhxuuE3TTUK+RffgJcR4kA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQGSH-0002HB-9f; Thu, 31 Oct 2019 19:50:01 +0000
Subject: Re: Q: how to build with system Heimdal
To: Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
 <20191029171833.GA13244@samba.org>
 <5d738a0a-13c5-7ac0-4cc4-3aa6e6c81627@samba.org>
 <20191029233215.GA22880@samba.org> <20191030225002.GA9786@samba.org>
Message-ID: <a06f0e08-b53c-bee4-a4aa-bb010c1626e7@samba.org>
Date: Thu, 31 Oct 2019 21:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030225002.GA9786@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 31/10/2019 0:50, Christof Schmitt wrote:
> On Tue, Oct 29, 2019 at 04:32:16PM -0700, Christof Schmitt via samba-technical wrote:
>> On Tue, Oct 29, 2019 at 08:06:42PM +0200, Uri Simchoni wrote:
>>> On 29/10/2019 19:18, Christof Schmitt wrote:
>>>> On Fri, Oct 25, 2019 at 12:33:33AM +0300, Uri Simchoni via samba-technical wrote:
>>>>> Hi,
>>>>>
>>>>> How should I build Samba with system heimdal? Should this do the trick:
>>>>> ./configure --with-system-heimdalkrb5 --without-ad-dc
>>>>> make
>>>>>
>>>>> (assuming I have Heimdal installed, of course)
>>>>>
>>>>> I tried this one on master, configure succeeds and the build fails
>>>>> like so (kind of surprising that it tries building system heimdal):
>>>>>
>>>>> waf: Entering directory `/home/vagrant/samba/bin/default'
>>>>>         Selected system Heimdal build
>>>>> [190/192] Compiling source4/heimdal/lib/vers/print_version.c
>>>>> 21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4',
>>>>> '-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1',
>>>>> '-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC',
>>>>> '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT',
>>>>> '-fstack-protector-strong',
>>>>> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL',
>>>>> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void
>>>>> __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',
>>>>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',
>>>>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>>>>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>>>>> '-I../../source4/lib', '-Isource4/include',
>>>>> '-I../../source4/include', '-Iinclude', '-I../../include',
>>>>> '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',
>>>>> '../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
>>>>> In file included from ../../source4/heimdal_build/roken.h:156:0,
>>>>>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
>>>>> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error:
>>>>> roken-common.h: No such file or directory
>>>>>  #include <roken-common.h>
>>>>>           ^~~~~~~~~~~~~~~~
>>>>> compilation terminated.
>>>>
>>>> This should work, but it broke back with Samba 4.10. The build works
>>>> with Samba 4.9. I am trying to bisect and debug this problem now.
>>>>
>>>> Christof
>>>>
>>>
>>> Oh, thanks! I didn't want to start actually debugging this before
>>> being sure I'm not missing some basic thing. Do note however that
>>> all of waf has been replaced for 4.10, so maybe it's more a matter
>>> of getting this back in shape than bisecting.
>>>
>>> I wanted to push forward another cross-compilation patch that
>>> involves removal of an explicit path of Heimdal headers, so I wanted
>>> to see if that breaks system-heimdal build and then realized it's
>>> broken before the patch.
>>
>> So far it looks like the problem is that the heimdal include files are
>> in /usr/include/heimdal (at least in the Ubuntu 18.04 that i am using
>> for debugging).
>>
>> Deleting source4/heimdal_build/krb5-types.h and adding this line allows
>> the system heimdal build to succeed:
>>
>> --- a/wscript_configure_system_heimdal
>> +++ b/wscript_configure_system_heimdal
>> @@ -18,6 +18,7 @@ if krb5_config:
>>              elif l.startswith("includedir="):
>>                  include_path = l.strip()[len("includedir="):]
>>                  heimdal_includedirs.append(include_path)
>> +                conf.ADD_EXTRA_INCLUDES(include_path)
>>                  conf.define('HEIMDAL_KRB5_TYPES_PATH',
>>                              include_path + "/krb5-types.h")
>>      finally:
>>
>> I am not sure if that is the cleanest solution, maybe someone with more
>> knowledge about waf and the build could provide input.
>>
>> I have not done further testing. Building with the internal heimdal
>> library and MIT would be the next steps. Ideally we would also establish
>> a system heimdal build in gitlab.
> 
> The patches in
> https://gitlab.com/samba-team/devel/samba/commits/christofschmitt-bug-14179
> 
> fix the build, if you want to give it a try. Now i am trying to get
> this running in gitlab and have a problem with the CentOS images.
> 
> Christof
> 

Works for me. Also RB+ me, except for the first one regarding
nettle-devel - I didn't follow all the gnutls/nettle versioning
discussions and I'm sure others can review this better than me.

Thanks!
Uri.

