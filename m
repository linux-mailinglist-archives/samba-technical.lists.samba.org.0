Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59152295E71
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 14:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hUZe6G09K5A55aMcxfP3WZnXSvB5V6si6e8T9u6ELSA=; b=FC+gFH1gyoMrHBdQkO3WnvNb1D
	6vzdwvchv++HEt7G6LaXBiF10UgHH4ArCRyVAhyXajV39b/XeSS1RIIu88bKXp7PQ7oiVH+qG0i3m
	mYR79QzU6dHuZcujdnra2ErjQorS51bnTjjj0GlVhwwuWcKA3TqAcvAkq8gTewIClrZE+CTgmqpN8
	UvolqLdttthotM69c+N5kaTHzdBaCsKmqYY344ZVurMP9NMk5B3JMpuf9GAT0D8ZmdoF3FMHogMKd
	VPZnIMMmnWDgX5MKBU6EgORSGnDawJy5jp8a71r+2Y982z6J9IOV0CFgHNd+IcZxihci9MVWpBX7u
	AhFZP85Q==;
Received: from ip6-localhost ([::1]:46844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVZnn-00DGmD-IS; Thu, 22 Oct 2020 12:34:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36194) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVZni-00DGm6-Mf
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 12:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=hUZe6G09K5A55aMcxfP3WZnXSvB5V6si6e8T9u6ELSA=; b=PhyfHtkL2uchYRMLIg0V54P7Xj
 ifdCReHDHOAyR4tQaCncSJQ2HGktUuHT8RjTPTubAGU61wOWi8ydfN51Gjgy3yqDo5NxNwi8c0a76
 9xTjqXyPqJnfcjvazTMp9gqGYba5GYmGbHRIg75jknMRoPLnop2T9SYCzGsgIzm+7J6lJMJ5K/T50
 slarmwuQXxyt72SrWr+gYqrVHlS3VZxf1TqqX/HBZ2IR07yl2iGNtraovlVOKd7DK4/Ka8RLsEWPV
 Les7lNS8siJqblnQ8FB0p+hjdVV01e1sNaKBsqeOxJowvlCgjhL+hw5Ua1hEZMqbKEgaQkC2py9X7
 1G/qhlKuIUBaBGzTgLtzoTqS+mnoBO9zb46JHravrPjSwP47A8A/DSY5WQhrQhFYIV/ghjH5yiwD+
 lJF6KRS0lH2X3sFw94MeIfiVWgvY5yP3UGI1WKVGfaqYRk69NXN7ybGPUindz8s6LHhP7Lt7EYwr6
 OCEE+Z/0eEDr22gsoLMXW2Ep;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVZnh-0001lM-3i
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 12:34:37 +0000
Subject: Re: 4.12 -> 4.13 upgrade
To: samba-technical@lists.samba.org
References: <5E76D2F9CEBD40A2BAADFE3EAB53360F@rotterdam.bazuin.nl>
 <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <0f2f2a1b-e818-e2d9-7372-bdc8331a9427@samba.org>
Date: Thu, 22 Oct 2020 13:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/10/2020 11:08, L.P.H. van Belle via samba-technical wrote:
>   
>
>> -----Oorspronkelijk bericht-----
>> Van: samba-technical
>> [mailto:samba-technical-bounces@lists.samba.org] Namens
>> Rowland penny via samba-technical
>> Verzonden: donderdag 22 oktober 2020 12:00
>> Aan: samba-technical@lists.samba.org
>> Onderwerp: Re: 4.12 -> 4.13 upgrade
>>
>> On 22/10/2020 10:06, L. van Belle via samba-technical wrote:
>>> Hai,
>>>
>>> Small question, i cant find this.
>>>
>>> So after the 4.13.0 (on
>>> release date) I upgrade a DC and that failed. so i reverted
>> back to my VM
>>> snapshot.
>>>
>>> I now see the following in the logs.
>>>
>>> [2020/10/22 10:48:36.514438,
>>>    0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
>>>
>>>    /usr/sbin/samba_dnsupdate: /usr/sbin/samba_dnsupdate:274:
>>> DeprecationWarning: please use
>> dns.resolver.Resolver.resolve() instead
>>> [2020/10/22 10:48:36.521212,
>>>    0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
>>>
>>>    /usr/sbin/samba_dnsupdate:
>>>
>>>    return resolver.query(name, name_type)
>>>
>>> Now, when i
>>> look at DC2, which stayed at 4.12.8, that one is not showing any
>>> DeprecationWarnings.
>>>
>>> And i recently added a 3th DC with 4.12.8 and same no
>> DeprecationWarning.
>>> Im trying to find why only DC1 has this message even after
>> the i reverted to
>>> the VM backup.
>>>
>>> So i hoped today that after the fix for 4.13 for the start
>> up, i did an
>>> upgrade again on my production DC1, having the
>> DeprecationWarning message
>>> Only that didnt solve it. Its all running fine thats not
>> the problem.
>>> Strange thing here is, DC2
>>> is a copy of DC1 and doesnt show this and same for the new DC setup.
>>>
>>> Anyone suggestions
>>>    what this is, and maybe how to make the error disapear?
>>>
>>> Its a very constant message since i see it every 10 minuts.
>> You would, that is the frequency that samba_dnsupdate is run.
>>
>> Could you be running bullseye on that DC ?
> No, im sure this is buster ;-)
>
>> Which would mean python3-dnspython V2.0.0 and in this version
>> resolver.query is deprecated.
>>
> Good one, i checked this.
>
> DC1  :
> dpkg-query -s python3-dnspython
> Package: python3-dnspython
> Status: install ok installed
> Priority: optional
> Section: python
> Installed-Size: 618
> ...
>
> Same on all DC's.
>
>
> All run the following setting with netbios name changed offcourse.
> [global]
>          netbios name = RTD-DC0
>          workgroup = ADDOM
>          realm = ADDOM.INTERNAL.TLD
>
>          server role = active directory domain controller
>          server services = -dns -spoolss
>          idmap_ldb:use rfc2307 = yes
>
>          # + A manual setup for TLS/SSL Certificates.
>          tls keyfile = /etc/ssl/local/private/xxxxxxxxxx.key.pem
>          tls certfile = /etc/ssl/local/certs/xxxxxxxxxx.cert.pem
>          tls cafile = /etc/ssl/local/certs/xxxxxxxxxx-ca.pem
>
>          template shell = /bin/bash
>          template homedir = /home/users/%U
>
>          load printers = no
>          printcap name = /dev/null
>
>          ntlm auth = mschapv2-and-ntlmv2-only
>
> And the shares offcourse..  So nothing fancy.
>
> Other options?
>
> And thanks for the reply :-)
>
> Greetz,
>
> Louis
>
>
>
OK, you are running buster but you must be running python3-dnspython 
version 2.0.0 because that error message is coming from that version, it 
has nothing to do with Samba:

     def query(self, qname, rdtype=dns.rdatatype.A, 
rdclass=dns.rdataclass.IN,
               tcp=False, source=None, raise_on_no_answer=True, 
source_port=0,
               lifetime=None):  # pragma: no cover
         """Query nameservers to find the answer to the question.

         This method calls resolve() with ``search=True``, and is
         provided for backwards compatbility with prior versions of
         dnspython.  See the documentation for the resolve() method for
         further details.
         """
         warnings.warn('please use dns.resolver.Resolver.resolve() instead',
                       DeprecationWarning, stacklevel=2)
         return self.resolve(qname, rdtype, rdclass, tcp, source,
                             raise_on_no_answer, source_port, lifetime,
                             True)

Version 1.16.0 (which Buster should be using) does not have the 
'DeprecationWarning'.

Rowland




