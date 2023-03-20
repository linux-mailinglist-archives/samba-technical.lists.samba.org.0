Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7176C0F04
	for <lists+samba-technical@lfdr.de>; Mon, 20 Mar 2023 11:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sMPn4j/Sxiw1HP3mCgc13mwyY6pDIei9/Asn4/LB/KY=; b=1J0isSLG0cIzq5Gg7v5DP/9A6d
	2WFDm0M9+D95mR5lm0z8FkGzgPDcG392WlLhPaC86+4/0hOrXUQ91R3zM6XzDLL0m7tyjEkZSIdrq
	kfEMN6VK4HZK9tobPz19zg3YowpdPc03D+WTmSuvhjZ6dmM1k2Fo/qvvIvuzlilb92XPW+so2zBtR
	o3nSqcTC0nAbyPPNSG5VLfllR7y2EnYcmSFe63syOfNst6sbJo2nztvkbDVHiXdMui0ZiQgdq+xwh
	KpZepMUd328YPbyUOCIAeJs8phP9J2baxoRqzGRb7UB5nhHOfy2ol+0Beu13VqNLjeM8fsHltbU1R
	llYFA41w==;
Received: from ip6-localhost ([::1]:64924 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peCrq-003Xde-KJ; Mon, 20 Mar 2023 10:35:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peCrk-003XdV-Vm
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 10:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=sMPn4j/Sxiw1HP3mCgc13mwyY6pDIei9/Asn4/LB/KY=; b=XHz/jzagqBek73gRCdQiRDexla
 gxEhCtR9rwHaRB/j/aWTwhyu1krOhOvLpPdHg+zWnM+gqMwxhEh2MTtcBkkDZEr4CCDhx5Q1Zms/U
 rdUYEFQBCgxEoDHzQQrzKupnClIczWwT5I9s/i+cjpfSg5OHuNGykMMroe2Z4WDdrGfVlVHrA8Uej
 DMaNnHlxny4TheqMrd6Ofz76LyDhc3dO1t7WPKDdjM+uOFeTZMptaFNiuqYtyjnzbEPGD0NGvelmE
 QaJ+gnpiwsVxAWEsw7iA4GlMp0tV8in/onCNhnMRCELqJgSaDNOCbWzFcCjjU0xuvp/aQDO4RrK7p
 1quveHbL+nkOEur1EvFBW0h+gIfahxWkbiR4uxGk7ZT74dhd+T538MQOvPsFHiV/SjrBiQq+Olmhy
 83jaVc903zeKkSB06D0dcKODhtW+mjF09m5TnIHaGulZu8ULzWccz8W1Ctrz8uGaooXVgjF4Y1Kma
 KamMq4ZyJ9ZVKztC7KDfishJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1peCrk-004P9G-2C
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 10:35:48 +0000
Message-ID: <29df88af-c2d7-017b-1f20-007647444ee4@samba.org>
Date: Mon, 20 Mar 2023 10:35:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
 <7d339362-a3f5-f58c-ff74-15c6bf839a65@samba.org>
 <ZBgxiBPMp2BtgEZ/@pinega.vda.li>
To: samba-technical@lists.samba.org
In-Reply-To: <ZBgxiBPMp2BtgEZ/@pinega.vda.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 20/03/2023 10:12, Alexander Bokovoy wrote:
> On ma, 20 maalis 2023, Rowland Penny via samba-technical wrote:
>>
>>
>> On 20/03/2023 08:39, Alexander Bokovoy via samba-technical wrote:
>>> Hi,
>>>
>>> On ma, 20 maalis 2023, Andrew Bartlett wrote:
>>>> On Sun, 2023-03-19 at 09:29 +0200, Alexander Bokovoy via samba-
>>>> technical wrote:
>>>>> Hi,
>>>>>
>>>>>
>>>>> I would be against a blended build against both MIT Kerberos and
>>>>> Heimdal
>>>>> Kerberos in a distribution. It is not going to bring you anything
>>>>> good,
>>>>> support wise.
>>>>>
>>>>> Andreas and I have submitted a talk to SambaXP about MIT
>>>>> Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where
>>>>> they
>>>>> stand against each other and what are perspectives. In short, both
>>>>> have
>>>>> unique features that do not exist in the other variant and both are
>>>>> close to being production-ready. We want to change the status for MIT
>>>>> Kerberos-based build from experimental to production. Effectively,
>>>>> actual decision for a version shipped in a particular distribution
>>>>> would
>>>>> need to be made by that distribution, of course.
>>>>>
>>>>> Distributions need to take into account security releases, as Rowland
>>>>> has pointed out as well. However, from my Fedora and RHEL experience,
>>>>> this is not a problem with MIT Kerberos -- certainly not more than
>>>>> with
>>>>> Heimdal. It is pretty much a coordination question and I believe we
>>>>> have
>>>>> very good coordination on that front with MIT Kerberos and
>>>>> distribution
>>>>> maintainers.
>>>>>
>>>>> If I was in Samba AD support for production deployments, I'd probably
>>>>> go with deploying DCs in a containerized image way to isolate
>>>>> completely
>>>>> from the rest of the OS. There are few images already that provide
>>>>> this
>>>>> setup: [1] was presented at SambaXP by Michael Adam and other folks
>>>>> now
>>>>> from IBM Storage, [2] is older and also active one.
>>>>>
>>>>> [1]
>>>>> https://github.com/samba-in-kubernetes/samba-container
>>>>>
>>>>> [2]
>>>>> https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
>>>>
>>>> Regarding the support and stability of a Samba AD Deployment based on
>>>> MIT Kerberos, given the advances in testing over the past few years, I
>>>> have, in 2023, no major concerns.  The features that are provided work
>>>> and can be expected to operate in production without concern.
>>>>
>>>> The "experimental" designation is no longer correct, but it is not
>>>> clear to me what different word we should apply instead, the closest I
>>>> can come to is "unsupported".
>>>
>>> Thanks. It is not 'unsupported', for sure, same way as linking against
>>> system-built Heimdal Kerberos library is not considered 'unsupported'.
>>>
>>> What should, perhaps, be defined is a matrix of features that are
>>> expected to work. If somebody files a bug against Fedora with Samba
>>> AD/MIT build or Samba upstream with a configuration that is expected to
>>> work, it will be investigated and worked on -- pretty much like we
>>> already do for years. This is definitely not an 'unsupported' state.
>>> Given that Samba Team as the upstream project does not provide
>>> commercial support in itself, this is best we do already. Commercial
>>> support is provided by separate entities and I don't see why MIT
>>> Kerberos build should be treated otherwise.
>>>
>>> Right now we don't have this formalized in any in-tree document. The
>>> wiki page says
>>> (https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller):
>>>
>>> -----------
>>> Samba as an AD DC only supports:
>>>
>>>    - The integrated LDAP server as AD back end. For details, see the
>>>      frequently asked question (FAQ) Does Samba AD DCs Support OpenLDAP or
>>>      Other LDAP Servers as Back End?
>>>    - The Heimdal Kerberos Key Distribution Center (KDC).
>>>
>>>      Samba provides experimental support for the MIT Kerberos KDC provided
>>>      by your operating system if you run Samba 4.7 or later and has been
>>>      built using the --with-system-mitkrb5 option. In other cases Samba
>>>      uses the Heimdal KDC included in Samba. For further details about
>>>      Samba using the MIT KDC, and why it is experimental see Running a
>>>      Samba AD DC with MIT Kerberos KDC.
>>> -----------
>>>
>>>   From this you don't get any state for system-provided Heimdal Kerberos
>>> build as well. There are also no guidelines for distribution maintainers.
>>>
>>> All this being said purely because we have a space for improvement, not
>>> as a critique only. I can prepare a draft that describes guidelines to
>>> distribution maintainers.
>>>
>>>> Just as a distribution can and will ship a pre-release version of some
>>>> software, to meet that distributions overall goals, Red Hat is free to
>>>> ship the "experimental" MIT-based Samba AD DC, and provide the security
>>>> support (in particular) for that configuration to its users.  Red Hat
>>>> has the resources and ability to coordinate the release of patched
>>>> Samba and a patched MIT Kerberos simultaneously if required, for
>>>> example.
>>>
>>> Can we please stop assigning it all to 'Red Hat'? Same way as Canonical
>>> or Catalyst IT are not driving decisions how Debian packaging of Samba
>>> is done, Red Hat as a company is not involved in deciding Fedora's
>>> packaging of Samba. Individuals are. I would prefer if our role would
>>> be reflected in these discussions.
>>>
>>>> However, things are different upstream.  I would suggest that, while
>>>> vendoring has well documented costs (as seen when we got stuck on 'old
>>>> Heimdal'), the choice to embed an copy of Heimdal has been a
>>>> significant advantage to upstream Samba.
>>>
>>> So this is an entirely different discussion. You might want to create a
>>> separate thread about it.
>>>
>>> I am not even contesting the fact that embedded Heimdal usage is there.
>>> When Tridge started Samba 4 work two decades ago, we did not have many
>>> important elements of a rapid collaboration culture we have today.  At
>>> that point it was great that we've got help from Love Astrand to make
>>> Heimdal embeddable and used that to iterate quickly Kerberos
>>> interoperability with Microsoft's Active Directory. At that point both
>>> Heimdal and MIT Kerberos were a lot less active upstreams with regards
>>> to advancing faster that goal. An irony and drama of git invention
>>> should also not be forgotten.
>>>
>>> It is normal for many upstreams to be able to build against different
>>> versions or implementations of libraries they depend on. Sure, something
>>> is marked as the primary one -- in case of Samba AD I would argue that
>>> the primary supported variant is 'Samba AD built against an embedded
>>> Heimdal Kerberos version'. However, this does not automatically
>>> disqualify 'Samba AD built against a system-provided MIT Kerberos
>>> version' or 'Samba AD built against a system-provided Heimdal Kerberos
>>> version'. Making them supported is a task of the system provider
>>> together with upstream -- to ensure that the specific target is viable
>>> and usable. This is what we do with MIT build in Fedora since 2017 and
>>> will do have a better standing once Fedora 39 is out due to krb5 1.20+
>>> dependency.
>>>
>>>> As a current example, this is allowing Claims support to be added, with
>>>> the KDC-side changes (to link the device and user) recorded in
>>>> lorikeet-heimdal and proposed upstream but not required to be accepted
>>>> at the time that the patches land in Samba.
>>>
>>> Is this referencing a work being tracked in
>>> https://gitlab.com/samba-team/devel/lorikeet-heimdal/-/commits/lorikeet-heimdal-202303200103
>>> ?
>>>> Likewise, security releases, which have been a significant burden of
>>>> late, can be made from Samba master and directly consumed by our users.
>>>
>>> Coordinating between upstreams is the only reasonable way going forward.
>>> There is no way we wouldn't get burned out from vendoring-in everything.
>>> It may work from time to time but a real answer is to build an ecosystem
>>> around the area and deal with it altogether.
>>>
>>>>
>>>> I'm very sorry I won't be at SambaXP this year, as I would very much
>>>> like to be part of the conversation around any changes we make here.
>>>>
>>>> It is not that the the current situation is ideal, but it has come with
>>>> a number of significant advantages.
>>>
>>> My aim is to not change that but rather enable what has been developed
>>> over years. Current state of claiming 'experimental' has lived itself
>>> out, in my opinion.
>>>
>>>
>>>> In both cases the development process includes tests, and these tests
>>>> are at least initially marked as knownfail for MIT Kerberos.  This is
>>>> not as dire as it seems, because more then 50% of a Samba development
>>>> task is tests, those supporting the MIT KDC are presented with a full
>>>> set of tests and a list of know failures the address.
>>>
>>> Indeed. For the record, current set of tests not supported by
>>> --with-system-mitkrb5 build:
>>>
>>> ----------------------------------------
>>> $ cat selftest/skip_mit_kdc
>>> # We do not support RODC yet
>>> .*rodc
>>> .*RODC
>>> ^samba4.ntvfs.cifs.ntlm.base.unlink
>>> ^samba4.ntvfs.cifs.krb5.base.unlink
>>>
>>> $ cat selftest/knownfail_mit_kdc_1_20
>>> ^samba.tests.krb5.compatability_tests.samba.tests.krb5.compatability_tests.SimpleKerberosTests.test_mit_pre_1_20_ticket_signature
>>> #
>>> # FAST tests
>>> # https://github.com/krb5/krb5/pull/1225#issuecomment-996418770
>>> #
>>> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_fast_encrypted_challenge_as_req_self\(
>>> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self\(
>>> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self_pac_request_none\(
>>> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self_pac_request_true\(
>>> #
>>> # Claims tests
>>> #
>>> ^samba.tests.krb5.claims_tests.samba.tests.krb5.claims_tests.ClaimsTests.test_claims_no_claims_to_self.ad_dc
>>> #
>>> # Group tests
>>> #
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_domain_local_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_domain_local_no_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_global_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_domain_local_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_domain_local_no_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_universal_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_universal_no_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_domain_local_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_domain_local_no_compression_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_universal_as_req_to_service.ad_dc
>>> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_universal_as_req_to_service.ad_dc
>>> ----------------------------------------
>>>
>>> Out of those the FAST tests should be fixed already. This leaves us with
>>> SID compression. Claims work is being done by Joseph right now for
>>> Heimdal KDC. As with the rest, my hope we can reuse a lot of this great
>>> work, like we did in past. SID compression is something I was planning
>>> to look at for MIT Kerberos myself.
>>>
>>>
>>>
>>>>
>>>> However that knownfail listing is the limit that the developers
>>>> providing new Samba AD features and providing the security support are
>>>> expected to provide.
>>>>
>>>> This last point is critical, as only one of these Kerberos
>>>> implementations is funded, and currently the Kerberos distribution that
>>>> the developers involved are funded to provide is Heimdal.
>>>>
>>>> This choice may of course change in the future, but as far as I see it
>>>> it will always be one or the other.
>>>
>>> So far, there is no real aim to drop one Kerberos implementation
>>> upstream and stick to the other one. There is a good distributed effort
>>> to cover both Heimdal and MIT Kerberos across multiple free software
>>> directory services. The most important part is that this effort is used
>>> to improve Kerberos testability and security everywhere, and this means
>>> also a better base for Samba AD users.
>>>
>>>
>>
>> I think what is being said here is, the use of MIT is no longer
>> experimental, it mainly works, but with a few exceptions when compared with
>> Heimdal. The use of MIT with a Samba AD DC is only being supported by Fedora
>> at this point in time.
> 
> Apart from the last sentence. At this moment Samba AD/MIT Kerberos is
> available in Fedora 27+, OpenSUSE 16+, ALT Linux, and Gentoo. I might
> have even missed something. So it is more than just one distribution and
> this is also one of reasons why we keep the details about MIT Kerberos
> build in the wiki -- to share documentation across multiple
> distributions.

You missed Slackware.
The problem isn't that there is documentation about MIT in the wiki, it 
is that the documentation appears to be out of date.

> 
> 
>>
>> If the above is true, then it would seem to have been true for quite
>> sometime, so why hasn't the Samba documentation been updated to reflect
>> this. If the documentation had been updated, then most of what was written
>> here yesterday, would never have been written (note: I am not pointing at
>> anyone in particular, we are all guilty of not updating the wiki and
>> documentation to a certain extent).
> 
> The documentation about supported features/combinations of options is
> long overdue to be fixed. I will work on some of the fixes as a part of
> my SambaXP talk preparation.

Thank you.

> 
>>
>> As for pointing the finger at red-hat, well that is easy, they are the only
>> ones that went on record and said there will never be an AD DC.
>>
>> The connection between Fedora and RHEL is interesting, Alexander basically
>> says (unless I am misunderstanding it again) that there is no connection
>> between red-hat and fedora, which is strange, because during the centos
>> debacle, I am sure red-hat claimed that fedora was upstream from RHEL.
> 
> I think you might be lacking an understanding how a Linux distribution
> development works. For example, there is also an Amazon Linux 2023 which
> is too based on Fedora. It is a downstream, similar to how RHEL is
> downstream of Fedora. However, there are substantial differences in how
> packages get selected to all three of those and how they maintained.
> 
> Here is a high level take from Fedora itself:
> https://docs.fedoraproject.org/en-US/quick-docs/fedora-and-red-hat-enterprise-linux/

That actually seems to back up what I said, Fedora is upstream from RHEL 
and is to a certain extent dependant on RHEL.

> 
> Handy, last week's Amazon Linux 2023 anouncement has a nice explanation:
> https://aws.amazon.com/blogs/aws/amazon-linux-2023-a-cloud-optimized-linux-distribution-with-long-term-support/

This all brings us back to the point that I am trying to make, the 
documentation isn't up to date, which if it had been, we wouldn't be 
here now, this is something you dealt with further above in this post.

> 
> ---------------
> When looking for a base to serve as a starting point for Amazon Linux
> 2023, Fedora was the best choice. We found that Fedora’s core tenets
> (Freedom, Friends, Features, First) resonate well with our vision for
> Amazon Linux. However, Amazon Linux focuses on a long-term, stable OS
> for the cloud, which is a notable different release cycle and lifecycle
> than Fedora. Amazon Linux 2023 provides updated versions of open-source
> software, a larger variety of packages, and frequent releases.
> 
> Amazon Linux 2023 isn’t directly comparable to any specific Fedora
> release. The Amazon Linux 2023 GA version includes components from
> Fedora 34, 35, and 36. Some of the components are the same as the
> components in Fedora, and some are modified. Other components more
> closely resemble the components in CentOS Stream 9 or were developed
> independently. The Amazon Linux kernel, on its side, is sourced from the
> long-term support options that are on kernel.org, chosen independently
> from the kernel provided by Fedora.
> ---------------
> 
> Fedora gets a lot of contributions from thousands people. There is more
> than one sponsoring organization and a lot of interest from multiple
> sides.
> 

