Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA06C0D50
	for <lists+samba-technical@lfdr.de>; Mon, 20 Mar 2023 10:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vx23mKQzZKWnoBHZP1jp+ExuHyXqNMV7cshx+MpEMBQ=; b=vxEZlTomN+bQS58KZVsVuBkPrP
	UnLUPDJzIXgcazYn3jv0A5QjncUjx4WlyDQ840vNBsD1oMDAC4lBKMojuUucO0EqVfhTUSltIdRQK
	HF5tD2YlWRYLV/77myHGsoagB1ocN4TeDgCZMa2+8sN7xIL+vosxa4m6skZAS8F8FsVhxs0iX4GI3
	HyjkoByeSf9yIgs15T+b2/ADiN3kcoyWJgWe2U7of5yODON5lRxhaEK1hwOA6eGYBsJHJY6hytlik
	uUYswzQ19byxbsDSSRKMjc1NEmm+4yb/LiHlOwYShwiMcnaIjpfA9JnyXULpY7uVI8uImhiqyc6Iw
	Jri6Ik8A==;
Received: from ip6-localhost ([::1]:19422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peBqu-003WPs-H1; Mon, 20 Mar 2023 09:30:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peBqn-003WPj-RW
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 09:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Vx23mKQzZKWnoBHZP1jp+ExuHyXqNMV7cshx+MpEMBQ=; b=29IV8rp/vYoCZra5Hr1bqHRBYb
 CArC8hacW+ytR1dWM0mixM1jJ2F3lLnjhAQWBTkBPH1HeVM3m0PHi2oDdFYJsux0SOHw8pHWQIPar
 teitRHW+oyl2D/7bWRS63Zek5OuF2xAkLvZ1CJSDdUVo1ZxueeJRcaKQ2KNdIn9PptEBGc+UPcN2e
 x5A1xuQqiRJOAPqwIeg0cqlSSWYWBLvdv8B2ZGcvgzqCRC8YMeL1VjVXkjuZVrIckreW2NWWA4u3y
 gXI3JT+5QdM0eq87UclkZgdUPOzyJoKmXf6O5uuhVSrPyTOLBFSXeetVTcQNe0tzjsLgrO6mdW+YH
 4YzNgiZd58N/wX10TcC5kHUxs5zKYgcyyJU3NK1fb2PfgQez8jFXYxnMwRDh8Fp4AbvPKUNglpe8w
 uaXYmxIky/H8YyX6bCfpJnA5df0kDWQi7+tX1LY6ofhVHm1u3pSLEFdLwmU+v7dWlIAXayPjywFNt
 jyJQ4f3lKE6v8oHR1TA41Bdb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1peBqm-004OHU-Tz
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 09:30:45 +0000
Message-ID: <7d339362-a3f5-f58c-ff74-15c6bf839a65@samba.org>
Date: Mon, 20 Mar 2023 09:30:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
In-Reply-To: <ZBgbvnB76vjgkq/B@pinega.vda.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 20/03/2023 08:39, Alexander Bokovoy via samba-technical wrote:
> Hi,
> 
> On ma, 20 maalis 2023, Andrew Bartlett wrote:
>> On Sun, 2023-03-19 at 09:29 +0200, Alexander Bokovoy via samba-
>> technical wrote:
>>> Hi,
>>>
>>>
>>> I would be against a blended build against both MIT Kerberos and
>>> Heimdal
>>> Kerberos in a distribution. It is not going to bring you anything
>>> good,
>>> support wise.
>>>
>>> Andreas and I have submitted a talk to SambaXP about MIT
>>> Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where
>>> they
>>> stand against each other and what are perspectives. In short, both
>>> have
>>> unique features that do not exist in the other variant and both are
>>> close to being production-ready. We want to change the status for MIT
>>> Kerberos-based build from experimental to production. Effectively,
>>> actual decision for a version shipped in a particular distribution
>>> would
>>> need to be made by that distribution, of course.
>>>
>>> Distributions need to take into account security releases, as Rowland
>>> has pointed out as well. However, from my Fedora and RHEL experience,
>>> this is not a problem with MIT Kerberos -- certainly not more than
>>> with
>>> Heimdal. It is pretty much a coordination question and I believe we
>>> have
>>> very good coordination on that front with MIT Kerberos and
>>> distribution
>>> maintainers.
>>>
>>> If I was in Samba AD support for production deployments, I'd probably
>>> go with deploying DCs in a containerized image way to isolate
>>> completely
>>> from the rest of the OS. There are few images already that provide
>>> this
>>> setup: [1] was presented at SambaXP by Michael Adam and other folks
>>> now
>>> from IBM Storage, [2] is older and also active one.
>>>
>>> [1]
>>> https://github.com/samba-in-kubernetes/samba-container
>>>
>>> [2]
>>> https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
>>
>> Regarding the support and stability of a Samba AD Deployment based on
>> MIT Kerberos, given the advances in testing over the past few years, I
>> have, in 2023, no major concerns.  The features that are provided work
>> and can be expected to operate in production without concern.
>>
>> The "experimental" designation is no longer correct, but it is not
>> clear to me what different word we should apply instead, the closest I
>> can come to is "unsupported".
> 
> Thanks. It is not 'unsupported', for sure, same way as linking against
> system-built Heimdal Kerberos library is not considered 'unsupported'.
> 
> What should, perhaps, be defined is a matrix of features that are
> expected to work. If somebody files a bug against Fedora with Samba
> AD/MIT build or Samba upstream with a configuration that is expected to
> work, it will be investigated and worked on -- pretty much like we
> already do for years. This is definitely not an 'unsupported' state.
> Given that Samba Team as the upstream project does not provide
> commercial support in itself, this is best we do already. Commercial
> support is provided by separate entities and I don't see why MIT
> Kerberos build should be treated otherwise.
> 
> Right now we don't have this formalized in any in-tree document. The
> wiki page says
> (https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller):
> 
> -----------
> Samba as an AD DC only supports:
> 
>   - The integrated LDAP server as AD back end. For details, see the
>     frequently asked question (FAQ) Does Samba AD DCs Support OpenLDAP or
>     Other LDAP Servers as Back End?
>   
>   - The Heimdal Kerberos Key Distribution Center (KDC).
> 
>     Samba provides experimental support for the MIT Kerberos KDC provided
>     by your operating system if you run Samba 4.7 or later and has been
>     built using the --with-system-mitkrb5 option. In other cases Samba
>     uses the Heimdal KDC included in Samba. For further details about
>     Samba using the MIT KDC, and why it is experimental see Running a
>     Samba AD DC with MIT Kerberos KDC.
> -----------
> 
>  From this you don't get any state for system-provided Heimdal Kerberos
> build as well. There are also no guidelines for distribution maintainers.
> 
> All this being said purely because we have a space for improvement, not
> as a critique only. I can prepare a draft that describes guidelines to
> distribution maintainers.
> 
>> Just as a distribution can and will ship a pre-release version of some
>> software, to meet that distributions overall goals, Red Hat is free to
>> ship the "experimental" MIT-based Samba AD DC, and provide the security
>> support (in particular) for that configuration to its users.  Red Hat
>> has the resources and ability to coordinate the release of patched
>> Samba and a patched MIT Kerberos simultaneously if required, for
>> example.
> 
> Can we please stop assigning it all to 'Red Hat'? Same way as Canonical
> or Catalyst IT are not driving decisions how Debian packaging of Samba
> is done, Red Hat as a company is not involved in deciding Fedora's
> packaging of Samba. Individuals are. I would prefer if our role would
> be reflected in these discussions.
> 
>> However, things are different upstream.  I would suggest that, while
>> vendoring has well documented costs (as seen when we got stuck on 'old
>> Heimdal'), the choice to embed an copy of Heimdal has been a
>> significant advantage to upstream Samba.
> 
> So this is an entirely different discussion. You might want to create a
> separate thread about it.
> 
> I am not even contesting the fact that embedded Heimdal usage is there.
> When Tridge started Samba 4 work two decades ago, we did not have many
> important elements of a rapid collaboration culture we have today.  At
> that point it was great that we've got help from Love Astrand to make
> Heimdal embeddable and used that to iterate quickly Kerberos
> interoperability with Microsoft's Active Directory. At that point both
> Heimdal and MIT Kerberos were a lot less active upstreams with regards
> to advancing faster that goal. An irony and drama of git invention
> should also not be forgotten.
> 
> It is normal for many upstreams to be able to build against different
> versions or implementations of libraries they depend on. Sure, something
> is marked as the primary one -- in case of Samba AD I would argue that
> the primary supported variant is 'Samba AD built against an embedded
> Heimdal Kerberos version'. However, this does not automatically
> disqualify 'Samba AD built against a system-provided MIT Kerberos
> version' or 'Samba AD built against a system-provided Heimdal Kerberos
> version'. Making them supported is a task of the system provider
> together with upstream -- to ensure that the specific target is viable
> and usable. This is what we do with MIT build in Fedora since 2017 and
> will do have a better standing once Fedora 39 is out due to krb5 1.20+
> dependency.
> 
>> As a current example, this is allowing Claims support to be added, with
>> the KDC-side changes (to link the device and user) recorded in
>> lorikeet-heimdal and proposed upstream but not required to be accepted
>> at the time that the patches land in Samba.
> 
> Is this referencing a work being tracked in
> https://gitlab.com/samba-team/devel/lorikeet-heimdal/-/commits/lorikeet-heimdal-202303200103
> ?
>   
>> Likewise, security releases, which have been a significant burden of
>> late, can be made from Samba master and directly consumed by our users.
> 
> Coordinating between upstreams is the only reasonable way going forward.
> There is no way we wouldn't get burned out from vendoring-in everything.
> It may work from time to time but a real answer is to build an ecosystem
> around the area and deal with it altogether.
> 
>>
>> I'm very sorry I won't be at SambaXP this year, as I would very much
>> like to be part of the conversation around any changes we make here.
>>
>> It is not that the the current situation is ideal, but it has come with
>> a number of significant advantages.
> 
> My aim is to not change that but rather enable what has been developed
> over years. Current state of claiming 'experimental' has lived itself
> out, in my opinion.
> 
> 
>> In both cases the development process includes tests, and these tests
>> are at least initially marked as knownfail for MIT Kerberos.  This is
>> not as dire as it seems, because more then 50% of a Samba development
>> task is tests, those supporting the MIT KDC are presented with a full
>> set of tests and a list of know failures the address.
> 
> Indeed. For the record, current set of tests not supported by
> --with-system-mitkrb5 build:
> 
> ----------------------------------------
> $ cat selftest/skip_mit_kdc
> # We do not support RODC yet
> .*rodc
> .*RODC
> ^samba4.ntvfs.cifs.ntlm.base.unlink
> ^samba4.ntvfs.cifs.krb5.base.unlink
> 
> $ cat selftest/knownfail_mit_kdc_1_20
> ^samba.tests.krb5.compatability_tests.samba.tests.krb5.compatability_tests.SimpleKerberosTests.test_mit_pre_1_20_ticket_signature
> #
> # FAST tests
> # https://github.com/krb5/krb5/pull/1225#issuecomment-996418770
> #
> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_fast_encrypted_challenge_as_req_self\(
> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self\(
> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self_pac_request_none\(
> ^samba.tests.krb5.fast_tests.samba.tests.krb5.fast_tests.FAST_Tests.test_simple_as_req_self_pac_request_true\(
> #
> # Claims tests
> #
> ^samba.tests.krb5.claims_tests.samba.tests.krb5.claims_tests.ClaimsTests.test_claims_no_claims_to_self.ad_dc
> #
> # Group tests
> #
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_domain_local_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_domain_local_no_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_global_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_domain_local_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_domain_local_no_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_universal_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_nested_universal_no_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_domain_local_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_domain_local_no_compression_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_primary_universal_as_req_to_service.ad_dc
> ^samba.tests.krb5.group_tests.samba.tests.krb5.group_tests.GroupTests.test_group_universal_as_req_to_service.ad_dc
> ----------------------------------------
> 
> Out of those the FAST tests should be fixed already. This leaves us with
> SID compression. Claims work is being done by Joseph right now for
> Heimdal KDC. As with the rest, my hope we can reuse a lot of this great
> work, like we did in past. SID compression is something I was planning
> to look at for MIT Kerberos myself.
> 
> 
> 
>>
>> However that knownfail listing is the limit that the developers
>> providing new Samba AD features and providing the security support are
>> expected to provide.
>>
>> This last point is critical, as only one of these Kerberos
>> implementations is funded, and currently the Kerberos distribution that
>> the developers involved are funded to provide is Heimdal.
>>
>> This choice may of course change in the future, but as far as I see it
>> it will always be one or the other.
> 
> So far, there is no real aim to drop one Kerberos implementation
> upstream and stick to the other one. There is a good distributed effort
> to cover both Heimdal and MIT Kerberos across multiple free software
> directory services. The most important part is that this effort is used
> to improve Kerberos testability and security everywhere, and this means
> also a better base for Samba AD users.
> 
> 

I think what is being said here is, the use of MIT is no longer 
experimental, it mainly works, but with a few exceptions when compared 
with Heimdal. The use of MIT with a Samba AD DC is only being supported 
by Fedora at this point in time.

If the above is true, then it would seem to have been true for quite 
sometime, so why hasn't the Samba documentation been updated to reflect 
this. If the documentation had been updated, then most of what was 
written here yesterday, would never have been written (note: I am not 
pointing at anyone in particular, we are all guilty of not updating the 
wiki and documentation to a certain extent).

As for pointing the finger at red-hat, well that is easy, they are the 
only ones that went on record and said there will never be an AD DC.

The connection between Fedora and RHEL is interesting, Alexander 
basically says (unless I am misunderstanding it again) that there is no 
connection between red-hat and fedora, which is strange, because during 
the centos debacle, I am sure red-hat claimed that fedora was upstream 
from RHEL.

Again, I am not knocking anyone (never was, sorry if it came across that 
way), I am just looking for information and clarification.

Rowland





