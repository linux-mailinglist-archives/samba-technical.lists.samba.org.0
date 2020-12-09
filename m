Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA92D4E59
	for <lists+samba-technical@lfdr.de>; Wed,  9 Dec 2020 23:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=m3IEBTEodfRO++Zljm/2G6DvMArMHQg7iMOxN61JRq0=; b=3A3mhLlacLwdmyvEyNqt0ECknu
	2hffKpxbqAGce7OHy5OyyJwv8SvhyIGfU62FoO53XrgOT5wBT3pmhUAU7elwEHZLmZ0HjjkPzaAyu
	sLOfktmulgylKK65v969tieWDGJ7uo7TK7jnJaVj90snChVrtQ/+ysiqVLr/IzANnsI+2byeR3HDw
	hpWMnGbJR/FOlX5bhaJE1i+Kjlvcd2PRQvirfKMA8BurC90lCbOHOxotAjD8rjdW8Ykjlazrsnsyy
	TWXrAWQmfHY2Bkl2AJT6PzUi5O0ghLrrD4F9mLZ7G7EGRIDfsufNCEp0+ijr54Vbsb+FCEqn1njBJ
	Yft9sm9A==;
Received: from ip6-localhost ([::1]:55394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kn8L5-000JcV-Ng; Wed, 09 Dec 2020 22:53:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30656) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn8Kx-000JZ2-0M
 for samba-technical@lists.samba.org; Wed, 09 Dec 2020 22:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=m3IEBTEodfRO++Zljm/2G6DvMArMHQg7iMOxN61JRq0=; b=wPJMjkzbozmKi9qWvIo0ihSfbf
 DJ4RtXeK5UYc880jmYZ7WrTMAyVhYfhV6I4F2xMZLodmn9B9twjZ+LQTyD7xBmtrcaLsYDWa5QND3
 zpPjA04I7PBqyWybrj9ksW8NoTKtsTMA0DUjMLRDL4NI7Tw4MqY5BENV5Ln5rvrFGwi5GmBf0Wft0
 ooU9VeSMXPicr8I/iivXCMPEsPGnHT4giW03uQjeKGmKWOLKKDk3FnUBtZyn2bouJAsXhgLSEgh6u
 7xSbUTNVUJ+JRRYmMM1ymo+3SaJ53yPgtR20RBpZlCbSK1Ih8AlZ/djBFOqIc7WAoVCBouOnxQ+8w
 BI0Jq0OQETIPVlHoTV7CKx/gWfEuNvgGwLg0Up+pm20F+h8Qc0x/twJPLjrGv9Y74Ef2cdLPI43dS
 mt039cvbrPeGBif3upzJStC0nmosdCMCchoE5ap2jjHA+ON0BtPk6Aq3G5CuTfvmkAhRHnYGIKN9t
 /DVsu6L92dYbynBvS6nE14Oq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn1bn-0007HR-Ou
 for samba-technical@lists.samba.org; Wed, 09 Dec 2020 15:42:27 +0000
Subject: Re: Samba testing on CentOS 8
To: samba-technical@lists.samba.org
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
Message-ID: <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
Date: Wed, 9 Dec 2020 15:42:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209003132.328ca229@martins.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/12/2020 13:31, Martin Schwenke via samba-technical wrote:
> Hi Alexander,
>
> Thanks for your reply!
>
> On Tue, 8 Dec 2020 14:44:06 +0200, Alexander
> Bokovoy <ab@samba.org> wrote:
>
>> On ti, 08 joulu 2020, Martin Schwenke via samba-technical wrote:
>>> We've been doing our CTDB and Samba testing using autocluster, based on
>>> the official CentOS-8.2 vagrant image.  This depends on using
>>> bootstrap/generated-dists/centos8/bootstrap.sh from the Samba source
>>> tree.
>>>
>>> Until recently this has worked just fine:
>>>
>>> + yum -v repolist all
>>> ...
>>> Repo-id            : PowerTools
>>> Repo-name          : CentOS-8 - PowerTools
>>> Repo-status        : enabled
>>> Repo-revision      : 8.2.2004
>>> Repo-distro-tags      : [cpe:/o:centos:centos:8]:  , 8, C, O, S, e, n, t
>>> Repo-updated       : Sat 31 Oct 2020 04:58:49 AEDT
>>> Repo-pkgs          : 2,010
>>> Repo-available-pkgs: 1,444
>>> Repo-size          : 1.0 G
>>> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
>>> Repo-baseurl       : http://mirror.realcompute.io/centos/8.2.2004/PowerTools/x86_64/os/ (9 more)
>>> Repo-expire        : 172,800 second(s) (last: Thu 03 Dec 2020 22:30:57 AEDT)
>>> Repo-filename      : /etc/yum.repos.d/CentOS-PowerTools.repo
>>> ...
>>> Repo-id            : Devel
>>> Repo-name          : CentOS-8 - Devel WARNING! FOR BUILDROOT USE ONLY!
>>> Repo-status        : disabled
>>> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
>>> Repo-expire        : 172,800 second(s) (last: unknown)
>>> Repo-filename      : /etc/yum.repos.d/CentOS-Devel.repo
>>> ...
>>> + yum config-manager --set-enabled PowerTools -y
>>> + yum config-manager --set-enabled Devel -y
>>> + yum update -y
>>> ...
>>>
>>> However, now:
>>>
>>> + yum -v repolist all
>>> ...
>>> Repo-id            : devel
>>> Repo-name          : CentOS Linux 8 - Devel WARNING! FOR BUILDROOT USE ONLY!
>>> Repo-status        : disabled
>>> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
>>> Repo-expire        : 172,800 second(s) (last: unknown)
>>> Repo-filename      : /etc/yum.repos.d/CentOS-Linux-Devel.repo
>>> ...
>>> Repo-id            : powertools
>>> Repo-name          : CentOS Linux 8 - PowerTools
>>> Repo-status        : disabled
>>> Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
>>> Repo-expire        : 172,800 second(s) (last: unknown)
>>> Repo-filename      : /etc/yum.repos.d/CentOS-Linux-PowerTools.repo
>>> Total packages: 14,251
>>> + yum config-manager --set-enabled PowerTools -y
>>> Error: No matching repo to modify: PowerTools.
>>>
>>> The whole thing falls in a heap because it appears that the Repo-id's
>>> are case-sensitive and that "PowerTools" and "Devel" have changed to
>>> lowercase in CentOS-8.3.
>>>
>>> I'm still using the CentOS-8.2 Vagrant image, so I'm a little confused
>>> about why the repos are now referring to 8.3 (not shown above for
>>> brevity, but definitely the case).  I'd certainly like to understand
>>> this... but I doubt that will solve the problem.  :-(
>> I think CentOS does not have separate supported minor releases anymore,
>> just the latest one. This, at least visible in your mirror list link --
>> it has one digit in the 'release=..' parameter, so you are on a rolling
>> release.
>>
>> If you want to stick to the previous releases, I don't think mirrorlist
>> tool supports that, so you would need to use a specific mirror for the
>> URL and replace 8.3.2011 there with the specific release folder.
> That makes sense.  However, I don't set up any of these repos myself.
> I just use the default repos from the Vagrant image.
>
> One possible part of this is a mirror problem.  In the runs that work I
> see the initial "yum update -y" actually update over 200 packages.  In
> the failures I see:
>
> + yum update -y
> Last metadata expiration check: 0:02:54 ago on Tue 08 Dec 2020 16:55:53 AEDT.
> Dependencies resolved.
> Nothing to do.
> Complete!
>
> So that's a strange difference... but see below...
>
>>> I'm wondering how we fix bootstrap/config.py to copy with this change.
>>> Does it have to be something horrible like the following patch?
>>>
>>> diff --git a/bootstrap/config.py b/bootstrap/config.py
>>> index 982ebae1cd1..8383aeb392d 100644
>>> --- a/bootstrap/config.py
>>> +++ b/bootstrap/config.py
>>> @@ -235,8 +235,10 @@ yum install -y dnf-plugins-core
>>>   yum install -y epel-release
>>>   
>>>   yum -v repolist all
>>> -yum config-manager --set-enabled PowerTools -y
>>> -yum config-manager --set-enabled Devel -y
>>> +yum config-manager --set-enabled PowerTools -y || \
>>> +    yum config-manager --set-enabled powertools -y
>>> +yum config-manager --set-enabled Devel -y || \
>>> +    yum config-manager --set-enabled devel -y
>>>   yum update -y
>>>   
>>>   yum install -y \
>>>
>>>
>>> Or is there a better way?
>> If these are the same in all previous versions, then that should be
>> enough. If not, may be we can make the repository names a part of
>> per-distribution configuration and run 'yum config-manager' for all of
>> them?
> The above is just for CentOS 8, so should cover all versions of that.
> I'm trying the above ugly patch (including a run of
> bootstrap/template.py --render to regenerate
> bootstrap/generated-dists/centos8/bootstrap.sh) and it seems to get through running bootstrap.sh.  Although many packages are updated, I see:
>
> ...
> + yum config-manager --set-enabled PowerTools -y
> Error: No matching repo to modify: PowerTools.
> + yum config-manager --set-enabled powertools -y
> + yum config-manager --set-enabled Devel -y
> Error: No matching repo to modify: Devel.
> + yum config-manager --set-enabled devel -y
> + yum update -y
> ...
>
> So the change is being exercised and it doesn't seem to be a mirror
> problem... although perhaps some mirrors are hopelessly out-of-date.
>
> If it works then I'll open a bug so the fix can be backported to 4.12
> and 4.13.
>
> Thanks...
>
> peace & happiness,
> martin
>
Hi, based on what is all over the internet about the future of Centos, 
should we continue to test anything on Centos 8 ? I mean, we may get to 
a point where we do not know whether a fault is down to Samba code or 
code that isn't in RHEL but is in Centos stream. Just a thought and I 
could be talking out of my hat.

Rowland



